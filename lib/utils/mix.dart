import 'package:intl/intl.dart';

// Mendapatkan tanggal hari ini
String getTodayDate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

// Mendapatkan status absensi masuk
String getPresenceEntryStatus(String jamMasuk) {
  if (jamMasuk.isEmpty || jamMasuk == '--:--') return 'Unknown';
  
  final DateTime time;
  try {
    time = DateFormat('HH:mm').parse(jamMasuk);
  } catch (e) {
    return 'Waktu Tidak Valid';
  }

  final DateTime startTime = DateTime(time.year, time.month, time.day, 6, 0); // 06:00
  final DateTime endTime = DateTime(time.year, time.month, time.day, 8, 0); // 08:00

  if (time.isAtSameMomentAs(startTime) || (time.isAfter(startTime) && time.isBefore(endTime))) {
    return 'Tepat Waktu';
  } else {
    return 'Terlambat';
  }
}

// Mendapatkan status absensi keluar
String getPresenceExitStatus(String jamKeluar) {
  if (jamKeluar.isEmpty || jamKeluar == '--:--') return 'Unknown';
  
  final DateTime time;
  try {
    time = DateFormat('HH:mm').parse(jamKeluar);
  } catch (e) {
    return 'Waktu Tidak Valid';
  }

  final DateTime endTime = DateTime(time.year, time.month, time.day, 17, 0); // 17:00
  final DateTime latestTime = DateTime(time.year, time.month, time.day, 18, 0); // 18:00

  if (time.isAtSameMomentAs(endTime) || (time.isAfter(endTime) && time.isBefore(latestTime))) {
    return 'Tepat Waktu';
  } else {
    return 'Pulang Cepat';
  }
}
