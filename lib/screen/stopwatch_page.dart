import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {

  int seconds = 0;
  Timer? timer;

  void start() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          seconds++;
        });
      },
    );
  }

  void stop() {
    timer?.cancel();
  }

  void reset() {
    timer?.cancel();
    setState(() {
      seconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stopwatch"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "$seconds detik",
              style: const TextStyle(fontSize: 40),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(
                  onPressed: start,
                  child: const Text("Start"),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: stop,
                  child: const Text("Stop"),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: reset,
                  child: const Text("Reset"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}