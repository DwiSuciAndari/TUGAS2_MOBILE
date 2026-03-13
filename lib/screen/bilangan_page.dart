import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {

  final angka = TextEditingController();
  String hasil = "";

  bool isPrima(int n) {
    if (n < 2) return false;
    for (int i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void cek() {
    int n = int.parse(angka.text);

    if (isPrima(n)) {
      hasil = "Bilangan Prima";
    } else if (n % 2 == 0) {
      hasil = "Bilangan Genap";
    } else {
      hasil = "Bilangan Ganjil";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bilangan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(controller: angka, decoration: const InputDecoration(labelText: "Masukkan angka")),

            ElevatedButton(onPressed: cek, child: const Text("Cek")),

            Text(hasil),
          ],
        ),
      ),
    );
  }
}