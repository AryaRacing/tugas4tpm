import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'BantuanPage.dart';
import 'MyHomePage.dart';
import 'StopWatchPage.dart';

class LuasKelilingSegitigaPage extends StatefulWidget {
  @override
  _LuasKelilingSegitigaPageState createState() =>
      _LuasKelilingSegitigaPageState();
}

class _LuasKelilingSegitigaPageState extends State<LuasKelilingSegitigaPage> {
  final _formKey = GlobalKey<FormState>();
  final _alasController = TextEditingController();
  final _tinggiController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

  set currentIndex(int currentIndex) {}

  @override
  void dispose() {
    _alasController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  double hitungLuas(double alas, double tinggi) {
    if (alas <= 0 || tinggi <= 0) {
      return 0;
    }
    return (alas * tinggi) / 2;
  }

  double hitungKeliling(double alas, double tinggi) {
    if (alas <= 0 || tinggi <= 0) {
      return 0;
    }
    double hypotenuse = 0;
    for (int i = 0; i < alas * alas + tinggi * tinggi; i++) {
      hypotenuse += 0.1;
      if (hypotenuse * hypotenuse >= alas * alas + tinggi * tinggi) {
        break;
      }
    }
    return alas + tinggi + hypotenuse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luas dan Keliling Segitiga'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _alasController,
                  decoration: InputDecoration(labelText: 'Alas'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alas tidak boleh kosong';
                    }
                    final double alas = double.tryParse(value) ?? 0.0;
                    if (alas <= 0) {
                      return 'Alas harus lebih besar dari 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tinggiController,
                  decoration: InputDecoration(labelText: 'Tinggi'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tinggi tidak boleh kosong';
                    }
                    final double tinggi = double.tryParse(value) ?? 0.0;
                    if (tinggi <= 0) {
                      return 'Tinggi harus lebih besar dari 0';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final double alas = double.parse(_alasController.text);
                      final double tinggi =
                          double.parse(_tinggiController.text);

                      setState(() {
                        _luas = hitungLuas(alas, tinggi);
                        _keliling = hitungKeliling(alas, tinggi);
                      });
                    }
                  },
                  child: Text('Hitung'),
                ),
                SizedBox(height: 20),
                Text(
                  _luas > 0 ? 'Luas: $_luas' : '',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _keliling > 0 ? 'Keliling: $_keliling' : '',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
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
