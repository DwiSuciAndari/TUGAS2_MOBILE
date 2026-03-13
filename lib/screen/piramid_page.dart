import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {

  final sisi = TextEditingController();
  final tinggi = TextEditingController();

  double luas = 0;
  double volume = 0;

  void hitung() {
    double s = double.parse(sisi.text);
    double t = double.parse(tinggi.text);

    luas = s * s;
    volume = (1 / 3) * luas * t;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Piramid")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(controller: sisi, decoration: const InputDecoration(labelText: "Sisi alas")),
            TextField(controller: tinggi, decoration: const InputDecoration(labelText: "Tinggi")),

            ElevatedButton(onPressed: hitung, child: const Text("Hitung")),

            Text("Luas: $luas"),
            Text("Volume: $volume"),
          ],
        ),
      ),
    );
  }
}