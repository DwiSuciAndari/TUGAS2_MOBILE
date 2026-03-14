import 'package:flutter/material.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({super.key});

  @override
  State<TotalPage> createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  TextEditingController angkaController = TextEditingController();
  String hasil = "-";

  void hitungTotal() {
    String angka = angkaController.text;

    if (angka.isEmpty) {
      setState(() {
        hasil = "Masukkan angka terlebih dahulu";
      });
    } else {
      setState(() {
        hasil = angka.length.toString();
      });
    }
  }

  Widget inputField() {
    return TextField(
      controller: angkaController,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        hintText: "Masukkan angka (contoh: 21345)",
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
          "Total Angka",
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

                  onPressed: hitungTotal,

                  child: const Text("Hitung", style: TextStyle(fontSize: 16)),
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
                        "Total Angka",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        hasil,
                        style: const TextStyle(
                          fontSize: 28,
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
