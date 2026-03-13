import 'package:flutter/material.dart';

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Kelompok")),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Kelompok",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Text("1. Cece"),
            Text("2. Celsi"),
            Text("3. Alma"),
            Text("4. Suci"),

            SizedBox(height: 20),

            Text("Mata Kuliah: Pemrograman Dart"),
          ],
        ),
      ),
    );
  }
}
