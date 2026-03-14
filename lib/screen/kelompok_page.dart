import 'package:flutter/material.dart';

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

  Widget anggota(String nama) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xffe63b8f),
            child: Icon(Icons.person, color: Colors.white),
          ),

          const SizedBox(width: 12),

          Text(
            nama,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: const Color(0xffe63b8f),
        title: const Text(
          "Data Kelompok",
          style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
        ),
        centerTitle: true,
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
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const Text(
                  "Nama Kelompok",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                anggota("Cendikia Permata Dewanti"),
                anggota("Celsi Fransisca Sitompul"),
                anggota("Alma Wulan Saptaningrum"),
                anggota("Dwi Suci Andari"),

                const SizedBox(height: 25),

                const Divider(),

                const SizedBox(height: 10),

                const Text(
                  "Mata Kuliah",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Pemrograman Dart",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
