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

enum CalculationType { Luas, Keliling }

class _LuasKelilingSegitigaPageState extends State<LuasKelilingSegitigaPage> {
  final _formKey = GlobalKey<FormState>();
  final _alasController = TextEditingController();
  final _tinggiController = TextEditingController();
  final _abController = TextEditingController();
  final _bcController = TextEditingController();
  final _caController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;
  CalculationType _calculationType = CalculationType.Luas;

  set currentIndex(int currentIndex) {}

  @override
  void dispose() {
    _alasController.dispose();
    _tinggiController.dispose();
    _abController.dispose();
    _bcController.dispose();
    _caController.dispose();
    super.dispose();
  }

  double hitungLuas(double alas, double tinggi) {
    if (alas <= 0 || tinggi <= 0) {
      return 0;
    }
    return (alas * tinggi) / 2;
  }

  double hitungKeliling(double ab, double bc, double ca) {
    if (ab <= 0 || bc <= 0 || ca <= 0) {
      return 0;
    }
    return ab + bc + ca;
  }

  void _showCalculationTypeDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.calculate),
                  title: Text('Hitung Luas'),
                  onTap: () {
                    setState(() {
                      _calculationType = CalculationType.Luas;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calculate),
                  title: Text('Hitung Keliling'),
                  onTap: () {
                    setState(() {
                      _calculationType = CalculationType.Keliling;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _showCalculationTypeDialog();
                      },
                      child: Text(
                        'Pilih Perhitungan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                if (_calculationType == CalculationType.Luas)
                  Column(
                    children: [
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
                          final double tinggi =
                              double.tryParse(value) ?? 0.0;
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
                            final double alas =
                                double.parse(_alasController.text);
                            final double tinggi =
                                double.parse(_tinggiController.text);

                            setState(() {
                              _luas = hitungLuas(alas, tinggi);
                            });
                          }
                        },
                        child: Text('Hitung Luas'),
                      ),
                    ],
                  ),
                if (_calculationType == CalculationType.Keliling)
                  Column(
                    children: [
                      TextFormField(
                        controller: _abController,
                        decoration: InputDecoration(labelText: 'Sisi AB'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Sisi AB tidak boleh kosong';
                          }
                          final double ab = double.tryParse(value) ?? 0.0;
                          if (ab <= 0) {
                            return 'Sisi AB harus lebih besar dari 0';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _bcController,
                        decoration: InputDecoration(labelText: 'Sisi BC'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Sisi BC tidak boleh kosong';
                          }
                          final double bc = double.tryParse(value) ?? 0.0;
                          if (bc <= 0) {
                            return 'Sisi BC harus lebih besar dari 0';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _caController,
                        decoration: InputDecoration(labelText: 'Sisi CA'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Sisi CA tidak boleh kosong';
                          }
                          final double ca = double.tryParse(value) ?? 0.0;
                          if (ca <= 0) {
                            return 'Sisi CA harus lebih besar dari 0';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final double ab =
                                double.parse(_abController.text);
                            final double bc =
                                double.parse(_bcController.text);
                            final double ca =
                                double.parse(_caController.text);

                            setState(() {
                              _keliling = hitungKeliling(ab, bc, ca);
                            });
                          }
                        },
                        child: Text('Hitung Keliling'),
                      ),
                    ],
                  ),
                SizedBox(height: 20),
                Text(
                  _calculationType == CalculationType.Luas
                      ? _luas > 0 ? 'Luas: $_luas' : ''
                      : _keliling > 0 ? 'Keliling: $_keliling' : '',
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
