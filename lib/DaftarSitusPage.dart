import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'StopWatchPage.dart';
import 'MyHomePage.dart';
import 'BantuanPage.dart';
import 'FavoritPage.dart';

class DaftarSitusPage extends StatefulWidget {
  @override
  _DaftarSitusPageState createState() => _DaftarSitusPageState();
}

class Situs {
  final String nama;
  final String url;
  bool isFavorite;

  Situs(this.nama, this.url, this.isFavorite);
}

class _DaftarSitusPageState extends State<DaftarSitusPage> {
  final List<Situs> _daftarSitus = [
    Situs('Situs 1', 'https://www.geeksforgeeks.org/', false),
    Situs('Situs 2', 'https://www.example.com', false),
    Situs('Situs 3', 'https://www.example.com', false),
    Situs('Situs 4', 'https://www.example.com', false),
    Situs('Situs 5', 'https://www.example.com', false),
    Situs('Situs 6', 'https://www.example.com', false),
  ];

  List<Situs> favoritSitus = [];

  set currentIndex(int currentIndex) {}

  void _addToFavorites(Situs situs) {
    setState(() {
      if (!favoritSitus.contains(situs)) {
        favoritSitus.add(situs);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Situs'),
      ),
      body: ListView.builder(
        itemCount: _daftarSitus.length,
        itemBuilder: (context, index) {
          final situs = _daftarSitus[index];
          return ListTile(
            leading: IconButton(
              icon: Icon(
                situs.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: situs.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  situs.isFavorite = !situs.isFavorite;
                  if (situs.isFavorite) {
                    _addToFavorites(situs);
                  }
                });
              },
            ),
            title: Text(situs.nama),
            subtitle: Text(situs.url),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                // Action when tapping on the arrow button
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            gap: 10,
            onTabChange: (index1) {
              print(index1);
              setState(() {
                currentIndex = index1;
              });
              switch (index1) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StopWatchPage(),
                    ),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BantuanPage(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritPage(favoritSitus: favoritSitus),
                    ),
                  );
                  break;
              }
            },
            tabs: const [
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
              GButton(
                icon: Icons.favorite,
                text: 'Favorit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
