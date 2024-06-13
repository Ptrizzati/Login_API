import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login/model/presensi.dart';
import 'package:login/utils/mix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/attandance_recap_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String nik = "", token = "", name = "", dept = "", imgUrl = "";
  late Future<Presensi> futurePresensi;

  // Get user data
  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nik = prefs.getString('nik') ?? "";
      token = prefs.getString('jwt') ?? "";
      name = prefs.getString('name') ?? "";
      dept = prefs.getString('dept') ?? "";
      imgUrl = prefs.getString('imgProfil') ?? "not found";
    });
  }

  // Get presence info
  Future<Presensi> fetchPresensi(String nik, String tanggal) async {
    String url = 'https://presensi.spilme.id/presence?nik=$nik&tanggal=$tanggal';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return Presensi.fromJson(jsonDecode(response.body));
    } else {
      // If data is not available, create default data
      return Presensi(
        id: 0,
        nik: nik,
        tanggal: getTodayDate(),
        jamMasuk: "--:--",
        jamKeluar: '--:--',
        lokasiMasuk: '-',
        lokasiKeluar: '-',
        status: '-',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Greetings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          imgUrl,
                          height: 84,
                          width: 84,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.manrope(
                              fontSize: 20,
                              color: const Color(0xFF263238),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dept,
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              color: const Color(0xFF263238),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                        iconSize: 32,
                        color: Colors.black,
                      ),
                      Positioned(
                        right: 10,
                        top: 8,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEF6497),
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: GoogleFonts.mPlus1p(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kehadiran hari ini',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      color: const Color(0xFF101317),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AttandanceRecapScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Rekap Absensi',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: const Color(0xFF12A3DA),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder<Presensi>(
                future: fetchPresensi(nik, getTodayDate()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    return Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color.fromARGB(255, 219, 226, 228), width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(35, 48, 134, 254),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset('assets/svgs/login_outlined.svg'),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Masuk',
                                        style: GoogleFonts.lexend(
                                          fontSize: 16,
                                          color: const Color(0xFF101317),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    data?.jamMasuk ?? '--:--',
                                    style: GoogleFonts.lexend(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF101317),
                                    ),
                                  ),
                                  Text(
                                    getPresenceEntryStatus(data?.jamMasuk ?? '-'),
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      color: const Color(0xFF101317),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color.fromARGB(255, 219, 226, 228), width: 1.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(35, 48, 134, 254),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: SvgPicture.asset('assets/svgs/logout_outlined.svg'),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Keluar',
                                        style: GoogleFonts.lexend(
                                          fontSize: 16,
                                          color: const Color(0xFF101317),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    data?.jamKeluar ?? '--:--',
                                    style: GoogleFonts.lexend(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF101317),
                                    ),
                                  ),
                                  Text(
                                    getPresenceExitStatus(data?.jamKeluar ?? '-'),
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      color: const Color(0xFF101317),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return AttandanceRecapScreen();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF3053AE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Buka Presensi",
                  style: GoogleFonts.lexend(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
