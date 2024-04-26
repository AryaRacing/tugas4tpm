import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi 5 Tombol',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(), 
      },
    );
  }
}


class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate credentials
                if (_usernameController.text == 'admin' && _passwordController.text == 'password') {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  Fluttertoast.showToast(
                    msg: "Username dan Password yang anda masukan salah",
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi 5 Tombol'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NamaAnggotaPage(),
                  ),
                );
              },
              child: Text('Nama Anggota'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BilanganPrimaPage(),
                  ),
                );
              },
              child: Text('Bilangan Prima'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LuasKelilingSegitigaPage(),
                  ),
                );
              },
              child: Text('Luas dan Volume Segitiga'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarSitusPage(),
                  ),
                );
              },
              child: Text('Daftar Situs'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritPage(),
                  ),
                );
              },
              child: Text('Favorit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Logout logic here
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}


class NamaAnggotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Anggota'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Nama:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Arya Syahputra Perdana', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text('NIM:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('123210157', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Nama:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Rawiansyah Andhika Suarnanusa', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      Text('NIM:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('123210186', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BilanganPrimaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              DataTable(
                columns: const [
                  DataColumn(label: Text('Bilangan')),
                  DataColumn(label: Text('Status')),
                ],
                rows: _generatePrimeNumberRows(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> _generatePrimeNumberRows() {
    List<DataRow> rows = [];

    for (int i = 1; i <= 100; i++) {
      bool isPrime = _isPrime(i);
      String status = isPrime ? 'Prima' : 'Bukan Prima';
      rows.add(DataRow(cells: [
        DataCell(Text(i.toString())),
        DataCell(Text(status)),
      ]));
    }

    return rows;
  }
  bool _isPrime(int num) {
    if (num <= 1) return false;
    if (num <= 3) return true;
    if (num % 2 == 0 || num % 3 == 0) return false;

    int i = 5;
    while (i * i <= num) {
      if (num % i == 0 || num % (i + 2) == 0) return false;
      i += 6;
    }

    return true;
  }
}

class LuasKelilingSegitigaPage extends StatefulWidget {
  @override
  _LuasKelilingSegitigaPageState createState() => _LuasKelilingSegitigaPageState();
}

class _LuasKelilingSegitigaPageState extends State<LuasKelilingSegitigaPage> {
  final _formKey = GlobalKey<FormState>();
  final _alasController = TextEditingController();
  final _tinggiController = TextEditingController();
  double _luas = 0;
  double _keliling = 0;

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
                      final double tinggi = double.parse(_tinggiController.text);

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
    );
  }
}

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
        icon: Image.asset('assets/love.png'),
        onPressed: () {
      setState(() {
        situs.isFavorite = !situs.isFavorite;
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
    );
  }
}

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
    );
  }
}
