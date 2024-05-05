import 'package:flutter/material.dart';
import 'DaftarSitusPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'MyHomePage.dart';
import 'BantuanPage.dart';
import 'StopWatchPage.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
    );
  }
}

class FavoritPage extends StatefulWidget {
  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  final List<Situs> _favoritSitus = [];

  set currentIndex(int currentIndex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorit'),
      ),
      body: _favoritSitus.isEmpty
          ? Center(
              child: Text('Tidak ada situs favorit'),
            )
          : ListView.builder(
              itemCount: _favoritSitus.length,
              itemBuilder: (context, index) {
                final situs = _favoritSitus[index];
                return ListTile(
                  leading: IconButton(
                    icon: Image.asset('assets/love.png'),
                    onPressed: () {
                      setState(() {
                        final index = _favoritSitus.indexOf(situs);
                        if (index != -1) {
                          _favoritSitus.removeAt(index);
                        }
                      });
                    },
                  ),
                  title: Text(situs.nama),
                  subtitle: Text(situs.url),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: situs.url),
                        ),
                      );
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
            ],
          ),
        ),
      ),
    );
  }
}
