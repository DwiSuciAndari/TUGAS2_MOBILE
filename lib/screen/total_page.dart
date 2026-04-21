import 'package:flutter/material.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({super.key});

  @override
  State<TotalPage> createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  TextEditingController angkaController = TextEditingController();
  String hasil = "-";

  Map<String, int> detailKarakter = {};

  void hitungTotal() {
    String angka = angkaController.text;

    if (angka.isEmpty) {
      setState(() {
        hasil = "Masukkan teks terlebih dahulu";
        detailKarakter.clear();
      });
    } else {
      Map<String, int> tempMap = {};
      String teksKecil = angka.toLowerCase();

      for (int i = 0; i < teksKecil.length; i++) {
        String char = teksKecil[i];
        tempMap[char] = (tempMap[char] ?? 0) + 1;
      }

      setState(() {
        hasil = angka.length.toString();
        detailKarakter = tempMap;
      });
    }
  }

  Widget inputField() {
    return TextField(
      controller: angkaController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Masukkan teks (contoh: dana 15 triliun)",
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
          "Total Angka & Huruf",
          style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                    child: const Text(
                      "Hitung",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
                          "Total Karakter",
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

                  if (detailKarakter.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Detail Karakter:",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: detailKarakter.entries.map((entry) {
                              String labelKarakter = entry.key == " "
                                  ? "Spasi"
                                  : entry.key;
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(
                                      0xffe63b8f,
                                    ).withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  "'$labelKarakter' = ${entry.value}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffe63b8f),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
