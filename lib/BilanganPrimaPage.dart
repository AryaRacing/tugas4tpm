import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tugas4tpm/MyHomePage.dart';
import 'BantuanPage.dart';
import 'StopWatchPage.dart';

class BilanganPrimaPage extends StatefulWidget {
  @override
  _MyBilanganPrimaPage createState() => _MyBilanganPrimaPage();
}

class _MyBilanganPrimaPage extends State<BilanganPrimaPage> {
  set currentIndex(int currentIndex) {}

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
