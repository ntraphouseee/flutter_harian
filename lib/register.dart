import 'package:flutter/material.dart';
import 'package:latihan/pages/loginapi_page.dart';
import 'componets/input_field.dart';
import 'componets/widget_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedGender;
  DateTime? selectedTime;

  void handlelogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LoginApiPage()),
    );
  }

  void _slectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedTime ?? DateTime(2000),
      firstDate: DateTime(1989),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _handleRegister() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        selectedGender == null ||
        selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Harap isi semua data!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Pendaftaran berhasil!"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            InputField(
              controller: nameController,
              label: "nama",
              hintText: "masukan nama anda",
            ),
            SizedBox(height: 15),
            InputField(
              controller: emailController,
              label: "email",
              hintText: "masukan email anda",
            ),
            SizedBox(height: 15),
            InputField(
              controller: passwordController,
              label: "password",
              hintText: "masukan password anda",
              obscureText: true,
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(
                labelText: "jenis kelamin",
                border: OutlineInputBorder(),
              ),
              items: ["laki-laki", "perempuan"]
                  .map(
                    (gender) =>
                        DropdownMenuItem(value: gender, child: Text(gender)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => _slectedDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: "tanggal lahir",
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  selectedTime == null
                      ? "Pilih tanggal lahir"
                      : "${selectedTime!.day}/${selectedTime!.month}/${selectedTime!.year}",
                ),
              ),
            ),
            SizedBox(height: 15),
            CoustumButton(text: "Register", onPressed: _handleRegister,)
          ],
        ),
      ),
    );
  }
}