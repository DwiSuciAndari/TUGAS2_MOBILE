import 'package:flutter/material.dart';
import 'weton_page.dart';
import 'detail_page.dart';
import 'hijriah_page.dart';

class KalenderPintarPage extends StatelessWidget {
  const KalenderPintarPage({super.key});

  Widget menuCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffe63b8f).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.calendar_today, color: Color(0xffe63b8f)),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        title: const Text("Kalender Pintar"),
        backgroundColor: const Color(0xffe63b8f),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            menuCard(
              context,
              "Weton Jawa",
              "Hitung hari & weton",
              Icons.calendar_today,
              const WetonPage(),
            ),
            menuCard(
              context,
              "Detail Kelahiran",
              "Tanggal & jam lahir",
              Icons.cake,
              const DetailPage(),
            ),
            menuCard(
              context,
              "Masehi ke Hijriah",
              "Konversi tanggal",
              Icons.nightlight,
              const HijriahPage(),
            ),
          ],
        ),
      ),
    );
  }
}
