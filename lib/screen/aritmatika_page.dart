import 'package:flutter/material.dart';

class AritmatikaPage extends StatefulWidget {
  const AritmatikaPage({super.key});

  @override
  State<AritmatikaPage> createState() => _AritmatikaPageState();
}

class _AritmatikaPageState extends State<AritmatikaPage> {
  final TextEditingController angka1 = TextEditingController();
  final TextEditingController angka2 = TextEditingController();

  String hasil = "0";

  String? errorAngka1;
  String? errorAngka2;

  void tambah() {
    if (errorAngka1 != null || errorAngka2 != null) return;

    double a = double.tryParse(angka1.text) ?? 0;
    double b = double.tryParse(angka2.text) ?? 0;
    setState(() {
      double res = a + b;
      hasil = res % 1 == 0 ? res.toInt().toString() : res.toString();
    });
  }

  void kurang() {
    if (errorAngka1 != null || errorAngka2 != null) return;

    double a = double.tryParse(angka1.text) ?? 0;
    double b = double.tryParse(angka2.text) ?? 0;
    setState(() {
      double res = a - b;
      hasil = res % 1 == 0 ? res.toInt().toString() : res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        title: const Text("Aritmatika"),
        backgroundColor: const Color(0xffe63b8f),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: angka1,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty && double.tryParse(value) == null) {
                      errorAngka1 = "Hanya bisa angka";
                    } else {
                      errorAngka1 = null;
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: "Angka 1",
                  errorText: errorAngka1,
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: angka2,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty && double.tryParse(value) == null) {
                      errorAngka2 = "Hanya bisa angka";
                    } else {
                      errorAngka2 = null;
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: "Angka 2",
                  errorText: errorAngka2,
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton(Icons.add, tambah),
                  const SizedBox(width: 30),
                  _buildActionButton(Icons.remove, kurang),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDE8EF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Hasil",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      hasil,
                      style: const TextStyle(
                        fontSize: 24,
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
    );
  }

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffe63b8f),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffe63b8f).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}
