import 'package:flutter/material.dart';
import 'kelompok_page.dart';
import 'kalkulator_page.dart';
import 'bilangan_page.dart';
import 'total_page.dart';
import 'stopwatch_page.dart';
import 'piramid_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget menuItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: const Color(0xffe63b8f)),

            const SizedBox(height: 12),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
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
        backgroundColor: const Color(0xffe63b8f),
        centerTitle: true,
        title: const Text(
          "Menu Utama",
          style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 1,

          children: [
            menuItem(
              context,
              Icons.group,
              "Data\nKelompok",
              const KelompokPage(),
            ),

            menuItem(
              context,
              Icons.calculate,
              "Penjumlahan\nPengurangan",
              const KalkulatorPage(),
            ),

            menuItem(
              context,
              Icons.numbers,
              "Ganjil / Genap\nPrima",
              const BilanganPage(),
            ),

            menuItem(
              context,
              Icons.summarize,
              "Total\nAngka",
              const TotalPage(),
            ),

            menuItem(context, Icons.timer, "Stopwatch", const StopwatchPage()),

            menuItem(
              context,
              Icons.change_history,
              "Luas & Volume\nPiramid",
              const PiramidPage(),
            ),
          ],
        ),
      ),
    );
  }
}
