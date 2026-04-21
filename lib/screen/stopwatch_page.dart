import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  Timer? timer;

  List<String> laps = [];

  void start() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        milliseconds++;
        if (milliseconds >= 100) {
          seconds++;
          milliseconds = 0;
          if (seconds >= 60) {
            minutes++;
            seconds = 0;
          }
        }
      });
    });
  }

  void stop() {
    timer?.cancel();
    setState(() {
      if (minutes > 0 || seconds > 0 || milliseconds > 0) {
        String m = minutes.toString().padLeft(2, '0');
        String s = seconds.toString().padLeft(2, '0');
        String ms = milliseconds.toString().padLeft(2, '0');

        String waktuLap = "$m.$s,$ms";
        laps.add(waktuLap);
      }
    });
  }

  void reset() {
    timer?.cancel();
    setState(() {
      minutes = 0;
      seconds = 0;
      milliseconds = 0;
      laps.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    String m = minutes.toString().padLeft(2, '0');
    String s = seconds.toString().padLeft(2, '0');
    String ms = milliseconds.toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xffe63b8f),
        centerTitle: true,
        title: const Text(
          "Stopwatch",
          style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.timer, size: 60, color: Color(0xffe63b8f)),
                const SizedBox(height: 20),
                Text(
                  "$m.$s,$ms",
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffe63b8f),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe63b8f),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                      ),
                      onPressed: start,
                      child: const Text("Start"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe63b8f),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                      ),
                      onPressed: stop,
                      child: const Text("Stop"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe63b8f),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 12,
                        ),
                      ),
                      onPressed: reset,
                      child: const Text("Reset"),
                    ),
                  ],
                ),

                if (laps.isNotEmpty) ...[
                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    "History Pause / Lap",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 150),
                    child: SingleChildScrollView(
                      child: Column(
                        children: laps.asMap().entries.map((entry) {
                          int indexLap = entry.key + 1;
                          String waktu = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lap $indexLap",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  waktu,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe63b8f),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
