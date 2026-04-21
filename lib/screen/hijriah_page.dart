import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriahPage extends StatefulWidget {
  const HijriahPage({super.key});

  @override
  State<HijriahPage> createState() => _HijriahPageState();
}

class _HijriahPageState extends State<HijriahPage> {
  DateTime? selectedDate;
  String tglHijriah = "-";
  String bulanHijriah = "-";
  String tahunHijriah = "-";

  int offsetHari = 0;

  void _hitungHijriah() {
    if (selectedDate == null) return;

    DateTime adjustedDate = selectedDate!.add(Duration(days: offsetHari));

    HijriCalendar hijriDate = HijriCalendar.fromDate(adjustedDate);

    setState(() {
      tglHijriah = hijriDate.hDay.toString();
      bulanHijriah = hijriDate.longMonthName;
      tahunHijriah = "${hijriDate.hYear} H";
    });
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          selectedDate ?? DateTime.now(), 
      firstDate: DateTime(1),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        offsetHari = 0; 
      });
      _hitungHijriah(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        title: const Text("Detail Hijriah"),
        backgroundColor: const Color(0xffe63b8f),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: pickDate,
                    icon: const Icon(Icons.event, size: 18),
                    label: const Text("Pilih Tanggal Masehi"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF6B4FA2),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            if (selectedDate != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Koreksi Jika Meleset:",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Color(0xffe63b8f),
                        ),
                        onPressed: () {
                          setState(() {
                            offsetHari--;
                            _hitungHijriah();
                          });
                        },
                      ),
                      Text(
                        offsetHari > 0
                            ? "+$offsetHari Hari"
                            : "$offsetHari Hari",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Color(0xffe63b8f),
                        ),
                        onPressed: () {
                          setState(() {
                            offsetHari++;
                            _hitungHijriah();
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDetailRow(
                    "Tanggal Masehi",
                    selectedDate == null
                        ? "-"
                        : DateFormat('dd-MM-yyyy').format(selectedDate!),
                  ),
                  const Divider(height: 24),
                  _buildDetailRow("Tanggal Hijriah", tglHijriah),
                  const Divider(height: 24),
                  _buildDetailRow("Bulan", bulanHijriah),
                  const Divider(height: 24),
                  _buildDetailRow("Tahun", tahunHijriah),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xffe63b8f),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
