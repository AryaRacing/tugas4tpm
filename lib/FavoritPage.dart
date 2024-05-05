import 'package:flutter/material.dart';
import 'DaftarSitusPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'MyHomePage.dart';
import 'BantuanPage.dart';
import 'StopWatchPage.dart';

class FavoritPage extends StatefulWidget {
  final List<Situs> favoritSitus;

  FavoritPage({required this.favoritSitus});

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  set currentIndex(int currentIndex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
      ),
      body: widget.favoritSitus.isEmpty
          ? Center(
              child: Text('Tidak ada situs favorit'),
            )
          : ListView.builder(
              itemCount: widget.favoritSitus.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        widget.favoritSitus.removeAt(index);
                      });
                    },
                  ),
                  title: Text(widget.favoritSitus[index].nama),
                  subtitle: Text(widget.favoritSitus[index].url),
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
                      builder: (context) => FavoritPage(favoritSitus: widget.favoritSitus),
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
