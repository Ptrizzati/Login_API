import 'package:flutter/material.dart';

void main() {
  runApp(const homepage1());
}

class homepage1 extends StatelessWidget {
  const homepage1({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/2.png'), // Ganti dengan path gambar user
                          ),
                        ),
                        SizedBox(height: 5), // Memberikan jarak 5px antara gambar dan teks
                        Text(
                          'Kehadiran Hari Ini', // Teks di bawah ikon user
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20), // Memberikan jarak 20px antara gambar dan teks
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Nama Pegawai', // Ganti dengan nama pegawai
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 80), // Memberikan jarak 80px antara teks dan ikon
                            Icon(
                              Icons.notifications, // Icon lonceng notifikasi
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        Text(
                          'Nama Departemen', // Ganti dengan nama departemen
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Memberikan jarak 20px antara baris sebelumnya dan kotak-kotak baru
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      decoration: BoxDecoration(
                         border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2), // Garis hijau
                        borderRadius: BorderRadius.circular(10), // Mengatur borderRadius agar tidak terlalu runcing
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10), // Memberikan jarak 10px antara kotak
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.login, // Icon masuk
                                color: Colors.black,
                              ),
                              SizedBox(width: 5), // Memberikan jarak 5px antara ikon dan teks
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), // Padding untuk menambah jarak
                                child: Text(
                                  'Masuk', // Tulisan untuk kotak pertama
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            '07:00', // Waktu untuk kotak pertama
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold, // Teks bold
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Tepat Waktu', // Tulisan untuk kotak pertama
                            style: TextStyle(
                              fontSize: 12, // Ukuran teks yang lebih kecil
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 120,
                      decoration: BoxDecoration(
                         border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2), // Garis hijau
                        borderRadius: BorderRadius.circular(10), // Mengatur borderRadius agar tidak terlalu runcing
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10), // Memberikan jarak 10px antara kotak
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.logout, // Icon keluar
                                color: Colors.black,
                              ),
                              SizedBox(width: 5), // Memberikan jarak 5px antara ikon dan teks
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), // Padding untuk menambah jarak
                                child: Text(
                                  'Keluar', // Tulisan untuk kotak kedua
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            '--:--', // Waktu untuk kotak kedua
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold, // Teks bold
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Pulang', // Tulisan untuk kotak kedua
                            style: TextStyle(
                              fontSize: 12, // Ukuran teks yang lebih kecil
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Memberikan jarak 20px antara baris sebelumnya dan kotak panjang
                GestureDetector(
                  onTap: () {
                    // Action when tapped
                  },
                  child: Container(
                    width: 317,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Warna biru
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle, // Icon lingkaran
                            color: Colors.white, // Warna putih
                          ),
                          SizedBox(width: 5), // Memberikan jarak 5px antara ikon dan teks
                          Text(
                            'Tekan Untuk Presensi Keluar', // Tulisan untuk kotak panjang
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Warna putih
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Memberikan jarak 20px antara baris sebelumnya dan kotak panjang
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Warna abu-abu
                        borderRadius: BorderRadius.circular(10), // Mengatur borderRadius agar tidak terlalu runcing
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10), // Memberikan jarak 10px antara kotak
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5), // Memberikan jarak 5px antara ikon dan teks
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), // Padding untuk menambah jarak
                                child: Text(
                                  'Izin Absen', // Tulisan untuk kotak pertama
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Isi Form Untuk mengisi izin Absen', // Waktu untuk kotak pertama
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              // Action when tapped
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Ajukan Izin', // Tulisan pada kotak Izin
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.purple, // Ubah warna latar belakang kotak menjadi ungu
                        borderRadius: BorderRadius.circular(10), // Mengatur borderRadius agar tidak terlalu runcing
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10), // Memberikan jarak 10px antara kotak
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 5), // Memberikan jarak 5px antara ikon dan teks
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), // Padding untuk menambah jarak
                                child: Text(
                                  'Ajukan Cuti', // Tulisan untuk kotak kedua
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Isi Form Untuk Mengajukan Cuti', // Waktu untuk kotak kedua
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              // Action when tapped
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Ajukan Cuti', // Tulisan pada kotak Cuti
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}