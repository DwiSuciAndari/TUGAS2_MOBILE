import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart'; 
import 'weton_helper.dart'; 

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1),
      lastDate: DateTime(2100),
    );

    if (date == null) return;
    if (!mounted) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? const TimeOfDay(hour: 14, minute: 20),
    );

    setState(() {
      selectedDate = date;
      if (time != null) {
        selectedTime = time;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String tanggal = "-";
    String hariWeton = "-";
    String hijriah = "-";
    String jam = selectedTime == null ? "- : -" : selectedTime!.format(context);

    if (selectedDate != null) {
      tanggal = DateFormat('dd-MM-yyyy').format(selectedDate!);

      var dataWeton = WetonHelper.hitungWeton(selectedDate!);
      hariWeton = dataWeton['weton'];

      HijriCalendar hijriDate = HijriCalendar.fromDate(selectedDate!);

      const List<String> namaBulanIndo = [
        '',
        'Muharram', 'Safar', 'Rabiul Awal', 'Rabiul Akhir',
        'Jumadil Awal', 'Jumadil Akhir', 'Rajab', 'Sya\'ban',
        'Ramadhan', 'Syawal', 'Dzulkaidah', 'Dzulhijjah',
      ];

      String bulan = namaBulanIndo[hijriDate.hMonth];
      hijriah = "${hijriDate.hDay} $bulan ${hijriDate.hYear} H";
    }

    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        title: const Text("Tanggal Lahir"),
        backgroundColor: const Color(0xffe63b8f),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xfff857a6), Color(0xffff5858)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cake, color: Colors.white),
                      SizedBox(width: 10),
                      Text(
                        "Pilih Tanggal Lahir",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: pickDateTime,
                    icon: const Icon(Icons.access_time, size: 20),
                    label: const Text("Input Tanggal & Jam"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xffe63b8f),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xfffce4ec)),
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
                  _buildResultRow("Tanggal", tanggal),
                  const Divider(color: Color(0xfffce4ec), height: 20),
                  _buildResultRow("Weton", hariWeton),
                  const Divider(color: Color(0xfffce4ec), height: 20),
                  _buildResultRow("Hijriah", hijriah),
                  const Divider(color: Color(0xfffce4ec), height: 20),
                  _buildResultRow("Jam", jam),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
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
