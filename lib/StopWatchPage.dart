import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'MyHomePage.dart';
import 'BantuanPage.dart';

class StopWatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopWatchPage> {
  Stopwatch stopwatch = Stopwatch();
  bool isRunning = false;
  int elapsedTime = 0;
  String formattedTime = '00:00:00';

  set currentIndex(int currentIndex) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedTime,
                style: TextStyle(fontSize: 50),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!isRunning) {
                        stopwatch.start();
                        setState(() {
                          isRunning = true;
                        });
                        Timer.periodic(Duration(seconds: 1), (timer) {
                          elapsedTime = stopwatch.elapsedMilliseconds;
                          formattedTime = _formatTime(
                              elapsedTime); // Format the elapsed time
                          setState(() {});
                        });
                      }
                    },
                    child: Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isRunning) {
                        stopwatch.stop();
                        setState(() {
                          isRunning = false;
                        });
                      }
                    },
                    child: Text('Stop'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      stopwatch.reset();
                      setState(() {
                        isRunning = false;
                        elapsedTime = 0;
                        formattedTime = '00:00:00';
                      });
                    },
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
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

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    seconds = seconds % 60;
    minutes = minutes % 60;
    hours = hours % 24;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${(milliseconds % 1000).toString().padLeft(3, '0')}';
  }
}
