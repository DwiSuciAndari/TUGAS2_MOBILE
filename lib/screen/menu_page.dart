import 'package:flutter/material.dart';
import 'kelompok_page.dart';
import 'kalkulator_page.dart';
import 'kalender_pintar_page.dart';
import 'login_page.dart'; 

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
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xffe63b8f)),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500),
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
        foregroundColor: Colors.white,
        title: const Text("Menu Utama"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
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
              Icons.group,
              "Data\nKelompok",
              const KelompokPage(),
            ),
            menuItem(
              context,
              Icons.calculate,
              "Kalkulator",
              const KalkulatorPage(),
            ),
            menuItem(
              context,
              Icons.calendar_month,
              "Kalender\nPintar",
              const KalenderPintarPage(),
            ),
          ],
        ),
      ),
    );
  }
}
