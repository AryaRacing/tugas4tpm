import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tugas4tpm/MyHomePage.dart';
import 'StopWatchPage.dart';
import 'LoginPage.dart';

class BantuanPage extends StatefulWidget {
  @override
  _MyBantuanPage createState() => _MyBantuanPage();
}

class _MyBantuanPage extends State<BantuanPage> {
  int currentIndex = 2;
  bool isLoggedIn = true;

  // Fungsi untuk logout
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    setState(() {
      isLoggedIn = false;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !isLoggedIn;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bantuan'),
          automaticallyImplyLeading: isLoggedIn,
        ),
        body: isLoggedIn ? buildHelpContent() : buildLoggedOutContent(),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              gap: 10,
              selectedIndex: currentIndex,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
                switch (index) {
                  case 0:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StopWatchPage(),
                      ),
                    );
                    break;
                  case 1:
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                    break;
                  case 2:
                    break;
                }
              },
              tabs: [
                GButton(
                  icon: Icons.watch,
                  text: 'Stopwatch',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.help,
                  text: 'Bantuan',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHelpContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Panduan Pengguna Aplikasi Tugas TPM 2',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Selamat datang di Aplikasi Tugas TPM 2! Aplikasi ini dirancang untuk memberikan berbagai fungsi menarik yang mencakup daftar anggota, perhitungan bilangan prima, pengukuran luas dan keliling segitiga, daftar situs rekomendasi, dan manajemen favorit. Berikut ini adalah panduan penggunaan aplikasi untuk membantu Anda memaksimalkan penggunaan fitur yang tersedia.\n\n1. Halaman Login\nSebelum mengakses fitur-fitur aplikasi, Anda harus melakukan login:\n\nMasukkan username dan password Anda.\nKlik tombol login untuk melanjutkan.\n\n2. Halaman Utama\nSetelah login, Anda akan diarahkan ke Halaman Utama. Di halaman ini, Anda akan menemukan lima menu utama:\n\na. Nama Anggota\nFungsi: Menampilkan daftar anggota tim.\nCara Mengakses: Klik pada tombol "Nama Anggota".\n\nb. Bilangan Prima\nFungsi: Aplikasi untuk menghitung bilangan prima.\nCara Mengakses: Klik pada tombol "Bilangan Prima" untuk memulai perhitungan.\n\nc. Luas dan Keliling Segitiga\nFungsi: Penghitung luas dan keliling segitiga.\nCara Mengakses: Klik pada tombol "Luas dan Volume Segitiga" untuk memulai perhitungan.\n\nd. Daftar Situs\nFungsi: Menampilkan daftar situs rekomendasi lengkap dengan gambar dan link.\nCara Mengakses: Klik pada tombol "Daftar Situs" untuk melihat daftar situs yang direkomendasikan.\n\ne. Favorit\nFungsi: Mengelola daftar favorit Anda.\nCara Mengakses: Klik pada tombol "Favorit" untuk mengakses dan mengelola favorit Anda.\n\n3. Bottom Navigation Bar\nDi bagian bawah layar, terdapat Bottom Navigation Bar yang terdiri dari tiga menu:\n\na. Stopwatch\nFungsi: Fitur stopwatch untuk pengukuran waktu.\nCara Mengakses: Klik pada ikon Stopwatch untuk menggunakan fitur pengukuran waktu.\n\nb. Home\nFungsi: Kembali ke Halaman Utama.\nCara Mengakses: Klik pada ikon Home untuk kembali ke layar utama.\n\nc. Bantuan\nFungsi: Menyediakan informasi tentang cara penggunaan aplikasi dan opsi untuk logout.\nCara Mengakses: Klik pada ikon Bantuan untuk melihat panduan penggunaan dan melakukan logout.\n\n4. Cara Menggunakan Menu Bantuan\nMenu Bantuan menyediakan Anda panduan penggunaan aplikasi dan opsi untuk logout:\n\nDi dalam menu Bantuan, Anda akan menemukan instruksi detil tentang cara menggunakan setiap fitur dalam aplikasi.\nUntuk melakukan logout, pilih opsi logout yang tersedia di dalam menu Bantuan.\n\nDengan mengikuti panduan ini, Anda dapat dengan mudah mengakses dan memanfaatkan semua fitur yang tersedia di Aplikasi Tugas TPM 2.\n\nSelamat menggunakan aplikasi!',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: logout,
              child: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoggedOutContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Anda telah logout.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: logout,
            child: Text('Login Kembali'),
          ),
        ],
      ),
    );
  }
}
