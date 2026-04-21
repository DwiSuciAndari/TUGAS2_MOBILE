class WetonHelper {
  static final DateTime anchorDate = DateTime(2026, 3, 27);

  static const List<String> hari = [
    'Jumat',
    'Sabtu',
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
  ];
  static const List<String> pasaran = [
    'Pon',
    'Wage',
    'Kliwon',
    'Legi',
    'Pahing',
  ];

  static const Map<String, int> neptuHari = {
    'Minggu': 5,
    'Senin': 4,
    'Selasa': 3,
    'Rabu': 7,
    'Kamis': 8,
    'Jumat': 6,
    'Sabtu': 9,
  };

  static const Map<String, int> neptuPasaran = {
    'Legi': 5,
    'Pahing': 9,
    'Pon': 7,
    'Wage': 4,
    'Kliwon': 8,
  };

  static Map<String, dynamic> hitungWeton(DateTime target) {
    DateTime anchor = DateTime(
      anchorDate.year,
      anchorDate.month,
      anchorDate.day,
    );
    DateTime date = DateTime(target.year, target.month, target.day);

    int diffDays = date.difference(anchor).inDays;
    int indexHari = (diffDays % 7 + 7) % 7;
    int indexPasaran = (diffDays % 5 + 5) % 5;

    String namaHari = hari[indexHari];
    String namaPasaran = pasaran[indexPasaran];
    int totalNeptu = neptuHari[namaHari]! + neptuPasaran[namaPasaran]!;

    return {
      'hari': namaHari,
      'pasaran': namaPasaran,
      'weton': '$namaHari, $namaPasaran',
      'neptu': totalNeptu,
    };
  }
}
