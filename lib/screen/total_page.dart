import 'package:flutter/material.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({super.key});

  @override
  State<TotalPage> createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {

  TextEditingController angkaController = TextEditingController();
  String hasil = "";

  void hitungTotal() {
    String angka = angkaController.text;

    if (angka.isEmpty) {
      setState(() {
        hasil = "Masukkan angka terlebih dahulu";
      });
    } else {
      setState(() {
        hasil = "Jumlah angka: ${angka.length}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Total Angka"),
        backgroundColor: Colors.pink,
      ),

      backgroundColor: const Color(0xffFCE4EC),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: angkaController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                labelText: "Masukkan angka (contoh: 21345)",
                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),

              onPressed: hitungTotal,

              child: const Text(
                "Hitung",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              hasil,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}