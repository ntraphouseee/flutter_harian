import 'package:flutter/material.dart';
import 'package:latihan/pages/calculator_page.dart';
import 'package:latihan/widget/widget_button.dart';
import 'package:latihan/widget/widget_textField.dart';
import 'package:latihan/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String statusLogin = "Please login to continue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please log in to continue."),
            Center(
              child: Image.asset(
                'assets/images/arjijiji.png',
                width: 100,
                height: 100,
              ),
            ),

            SizedBox(height: 20),
            CustomTextField(
              hintText: "Username",
              controller: _usernameController,
              obscureText: false,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            Center(
              child: CustomButton(
                text: "Login",
                textColor: Colors.blueAccent,
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == "admin" && password == "123") {
                    setState(() {
                      statusLogin = "Login successful!";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalculatorPage()),
                    );
                  } else {
                    setState(() {
                      statusLogin = "Invalid username or password.";
                    });
                  }
                },
              ),
            ),
            Text(statusLogin),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: "Register",
                textColor: Colors.indigoAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
