import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'weton_helper.dart';

class WetonPage extends StatefulWidget {
  const WetonPage({super.key});

  @override
  State<WetonPage> createState() => _WetonPageState();
}

class _WetonPageState extends State<WetonPage> {
  DateTime? selectedDate;
  String hariLahir = "-";
  String pasaran = "-";
  String neptu = "-";

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      var dataWeton = WetonHelper.hitungWeton(picked);

      setState(() {
        selectedDate = picked;
        hariLahir = dataWeton['hari'];
        pasaran = dataWeton['pasaran'];
        neptu = dataWeton['neptu'].toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        title: const Text("Detail Weton"),
        backgroundColor: const Color(0xffe63b8f),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              onPressed: pickDate,
              icon: const Icon(Icons.calendar_month, size: 18),
              label: const Text("Pilih Tanggal"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF6B4FA2),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: const BorderSide(color: Colors.black12, width: 0.5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 24),
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
                    "Masehi",
                    selectedDate == null
                        ? "-"
                        : DateFormat('dd MMMM yyyy').format(selectedDate!),
                  ),
                  const Divider(height: 24),
                  _buildDetailRow("Hari", hariLahir),
                  const Divider(height: 24),
                  _buildDetailRow("Pasaran", pasaran),
                  const Divider(height: 24),
                  _buildDetailRow("Neptu", neptu),
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
