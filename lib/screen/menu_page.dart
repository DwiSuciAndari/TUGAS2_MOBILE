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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 188, 212), // ganti warna disini
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 4),
            )
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 40,
              color: Colors.black,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
      appBar: AppBar(
        title: const Text("Menu Utama"),
        centerTitle: true,
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
              "Ganjil\nGenap\nPrima",
              const BilanganPage(),
            ),

            menuItem(
              context,
              Icons.summarize,
              "Total\nAngka",
              const TotalPage(),
            ),

            menuItem(
              context,
              Icons.timer,
              "Stopwatch",
              const StopwatchPage(),
            ),

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