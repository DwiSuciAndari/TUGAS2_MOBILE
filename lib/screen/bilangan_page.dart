import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final angka = TextEditingController();
  String hasil = "-";

  String? errorAngka;

  bool isPrima(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void cek() {
    if (errorAngka != null || angka.text.isEmpty) return;
    int? n = int.tryParse(angka.text);
    if (n == null) return;

    setState(() {
      if (isPrima(n)) {
        hasil = "Bilangan Prima";
      } else if (n % 2 == 0) {
        hasil = "Bilangan Genap";
      } else {
        hasil = "Bilangan Ganjil";
      }
    });
  }

  Widget inputField() {
    return TextField(
      controller: angka,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          if (value.isNotEmpty && int.tryParse(value) == null) {
            errorAngka = "Hanya bisa angka bulat";
          } else {
            errorAngka = null;
          }
        });
      },
      decoration: InputDecoration(
        hintText: "Masukkan Angka",
        errorText: errorAngka,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xffe63b8f),
        centerTitle: true,
        title: const Text(
          "Bilangan",
          style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                inputField(),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffe63b8f),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: cek,
                  child: const Text("Cek", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xfffce4ec),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Hasil",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        hasil,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffe63b8f),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
