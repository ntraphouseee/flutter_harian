import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _angkaSatu = TextEditingController();
  final TextEditingController _angkaDua = TextEditingController();
  String _hasil = "";
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
              "Welcome to the Home Page!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _angkaSatu,
                    decoration: InputDecoration(
                      hintText: "Angka Pertama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _angkaDua,
                    decoration: InputDecoration(
                      hintText: "Angka Kedua",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double angka1 = double.tryParse(_angkaSatu.text) ?? 0;
                      double angka2 = double.tryParse(_angkaDua.text) ?? 0;
                      setState(() {
                        _hasil = (angka1 + angka2).toString();
                      });
                    },
                    child: Text("+"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double angka1 = double.tryParse(_angkaSatu.text) ?? 0;
                      double angka2 = double.tryParse(_angkaDua.text) ?? 0;
                      setState(() {
                        _hasil = (angka1 - angka2).toString();
                      });
                    },
                    child: Text("-"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double angka1 = double.tryParse(_angkaSatu.text) ?? 0;
                      double angka2 = double.tryParse(_angkaDua.text) ?? 0;
                      setState(() {
                        _hasil = (angka1 * angka2).toString();
                      });
                    },
                    child: Text("*"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      double angka1 = double.tryParse(_angkaSatu.text) ?? 0;
                      double angka2 = double.tryParse(_angkaDua.text) ?? 0;
                      setState(() {
                        _hasil = (angka1 / angka2).toString();
                      });
                    },
                    child: Text("/"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Hasil: $_hasil",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
