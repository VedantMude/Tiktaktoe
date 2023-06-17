import 'package:flutter/material.dart';
import 'package:tiktakto/Home.dart';

void main() {
  runApp(MyApp());
}
// GESTURE DETECTION FOR TAPPED / FOR SOME SORT OF EVENT TO BE OCCURS

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: game(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    "TIK TAK TOE",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 90.0),
              child: Expanded(
                flex: 3,
                child: Container(
                  child: Image.asset(
                    "assets/games.png",
                    height: 300.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 20, 60),
              child: Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          "Play Now",
                          style: TextStyle(fontSize: 40.0, letterSpacing: 3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
