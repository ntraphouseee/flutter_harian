import 'package:flutter/material.dart';
import 'package:latihan/widget/widget_button.dart';
import 'package:latihan/widget/widget_textField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _gender = 'Laki-laki';
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: _nameController,
              hintText: "Nama Lengkap",
              obscureText: false,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Email",
              controller: _emailController,
              obscureText: false,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _gender,
              items: [
                'Laki-laki',
                'Perempuan',
              ].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (val) {
                setState(() {
                  _gender = val!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "Tanggal Lahir belum dipilih"
                        : "Tanggal Lahir: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}",
                  ),
                ),
                TextButton(
                  onPressed: _pickDate,
                  child: const Text("Pilih Tanggal"),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: "Register",
              textColor: Colors.indigo,
              onPressed: () {
                // Handle registration logic here
                String name = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;

                if (name.isNotEmpty &&
                    email.isNotEmpty &&
                    password.isNotEmpty &&
                    _selectedDate != null) {
                  // Registration successful
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Registration successful for $name"),
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please fill all fields and select a date.",
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
