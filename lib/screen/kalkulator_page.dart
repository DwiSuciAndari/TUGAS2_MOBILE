import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  TextEditingController angka1Controller = TextEditingController();
  TextEditingController angka2Controller = TextEditingController();

  String hasil = "0";

  void tambah() {
    int a = int.parse(angka1Controller.text);
    int b = int.parse(angka2Controller.text);

    setState(() {
      hasil = (a + b).toString();
    });
  }

  void kurang() {
    int a = int.parse(angka1Controller.text);
    int b = int.parse(angka2Controller.text);

    setState(() {
      hasil = (a - b).toString();
    });
  }

  Widget inputField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
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
          "Kalkulator",
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
                inputField("Masukkan Angka 1", angka1Controller),

                const SizedBox(height: 15),

                inputField("Masukkan Angka 2", angka2Controller),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    FloatingActionButton(
                      heroTag: "plus",
                      backgroundColor: const Color(0xffe63b8f),
                      onPressed: tambah,
                      child: const Icon(Icons.add),
                    ),

                    FloatingActionButton(
                      heroTag: "minus",
                      backgroundColor: const Color(0xffe63b8f),
                      onPressed: kurang,
                      child: const Icon(Icons.remove),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,

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
