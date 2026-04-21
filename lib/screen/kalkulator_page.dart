import 'package:flutter/material.dart';
import 'aritmatika_page.dart';
import 'bilangan_page.dart';
import 'total_page.dart';
import 'piramid_page.dart';
import 'stopwatch_page.dart';

class KalkulatorPage extends StatelessWidget {
  const KalkulatorPage({super.key});

  Widget menuItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xffe63b8f)),
            const SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: const Text("Kalkulator"),
        backgroundColor: const Color(0xffe63b8f),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            menuItem(
              context,
              Icons.calculate,
              "Penjumlahan\nPengurangan",
              AritmatikaPage(),
            ),
            menuItem(
              context,
              Icons.numbers,
              "Ganjil / Genap\nPrima",
              BilanganPage(),
            ),
            menuItem(context, Icons.summarize, "Total\nAngka", TotalPage()),
            menuItem(context, Icons.timer, "Stopwatch", StopwatchPage()),
            menuItem(context, Icons.change_history, "Piramid", PiramidPage()),
          ],
        ),
      ),
    );
  }
}
