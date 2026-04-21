import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final sisiLuasController = TextEditingController();
  final sisiVolController = TextEditingController();
  final tinggiVolController = TextEditingController();

  String hasilLuas = "0";
  String hasilVolume = "0";

  String? errorSisiLuas;
  String? errorSisiVol;
  String? errorTinggiVol;

  void hitungLuas() {
    if (errorSisiLuas != null || sisiLuasController.text.isEmpty) return;

    double s = double.tryParse(sisiLuasController.text) ?? 0;
    double luas = s * s;

    setState(() {
      hasilLuas = luas.toStringAsFixed(luas % 1 == 0 ? 0 : 2);
    });
  }

  void resetLuas() {
    setState(() {
      sisiLuasController.clear();
      hasilLuas = "0";
      errorSisiLuas = null;
    });
  }

  void hitungVolume() {
    if (errorSisiVol != null ||
        errorTinggiVol != null ||
        sisiVolController.text.isEmpty ||
        tinggiVolController.text.isEmpty)
      return;

    double s = double.tryParse(sisiVolController.text) ?? 0;
    double t = double.tryParse(tinggiVolController.text) ?? 0;

    double luas = s * s;
    double volume = (1 / 3) * luas * t;

    setState(() {
      hasilVolume = volume.toStringAsFixed(volume % 1 == 0 ? 0 : 2);
    });
  }

  void resetVolume() {
    setState(() {
      sisiVolController.clear();
      tinggiVolController.clear();
      hasilVolume = "0";
      errorSisiVol = null;
      errorTinggiVol = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f1f5),
      appBar: AppBar(
        backgroundColor: const Color(0xffe63b8f),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Piramid",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Hitung Luas Alas",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe63b8f),
                      ),
                    ),
                    const SizedBox(height: 25),
                    _buildInput(
                      sisiLuasController,
                      "Sisi Alas",
                      errorText: errorSisiLuas,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty &&
                              double.tryParse(value) == null) {
                            errorSisiLuas = "Hanya bisa angka";
                          } else {
                            errorSisiLuas = null;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffe63b8f),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            onPressed: hitungLuas,
                            child: const Text(
                              "HITUNG LUAS",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xffe63b8f),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: Color(0xffe63b8f)),
                            ),
                            elevation: 0,
                          ),
                          onPressed: resetLuas,
                          child: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE8EF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Hasil Perhitungan",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          _rowHasil("Luas Alas", hasilLuas),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Hitung Volume",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe63b8f),
                      ),
                    ),
                    const SizedBox(height: 25),
                    _buildInput(
                      sisiVolController,
                      "Sisi Alas",
                      errorText: errorSisiVol,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty &&
                              double.tryParse(value) == null) {
                            errorSisiVol = "Hanya bisa angka";
                          } else {
                            errorSisiVol = null;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    _buildInput(
                      tinggiVolController,
                      "Tinggi",
                      errorText: errorTinggiVol,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty &&
                              double.tryParse(value) == null) {
                            errorTinggiVol = "Hanya bisa angka";
                          } else {
                            errorTinggiVol = null;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffe63b8f),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 0,
                            ),
                            onPressed: hitungVolume,
                            child: const Text(
                              "HITUNG VOLUME",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xffe63b8f),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(color: Color(0xffe63b8f)),
                            ),
                            elevation: 0,
                          ),
                          onPressed: resetVolume,
                          child: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE8EF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Hasil Perhitungan",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          _rowHasil("Volume", hasilVolume),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String hint, {
    String? errorText,
    void Function(String)? onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _rowHasil(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffe63b8f),
          ),
        ),
      ],
    );
  }
}
