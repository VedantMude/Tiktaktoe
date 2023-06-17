import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool p = true; // O
  int o = 0;
  int x = 0;
  int c = 0;
  int w = 0;
  bool draw = true;

  List<String> s = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: SafeArea(
                  child: Text(
                    "Tic Tak Toe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 20, 5),
                    child: Column(
                      children: [
                        Text(
                          "Player O",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          o.toString(),
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Player X",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        x.toString(),
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex:
                  3, // to know how much space we want to allocate as expand tries to occupied the avaible space

              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            s[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Container(
                child: Text("Created By : Vedant"),
              ),
            )),
          ],
        ));
  }

  void tapped(int index) {
    setState(() {
      if (p == true && s[index] == '') {
        s[index] = 'O';
        w = w + 1;
      } else if (s[index] == '' && !p) {
        s[index] = 'X';
        w = w + 1;
      }
      p = !p;
      c++;

      checkwinner();
    });
  }

  void checkwinner() {
    if (s[0] == s[1] && s[1] == s[2] && s[0] != '') {
      showdmessage(s[0]);
    }
    if (s[0] == s[3] && s[0] == s[6] && s[0] != '') {
      showdmessage(s[0]);
    }
    if (s[0] == s[4] && s[0] == s[8] && s[0] != '') {
      showdmessage(s[0]);
    }
    if (s[1] == s[4] && s[7] == s[1] && s[1] != '') {
      showdmessage(s[1]);
    }
    if (s[2] == s[8] && s[2] == s[5] && s[2] != '') {
      showdmessage(s[2]);
    }
    if (s[3] == s[4] && s[3] == s[5] && s[3] != '') {
      showdmessage(s[3]);
    }
    if (s[6] == s[7] && s[8] == s[7] && s[7] != '') {
      showdmessage(s[6]);
    }
    if (s[2] == s[4] && s[2] == s[6] && s[2] != '') {
      showdmessage(s[2]);
    } else if (w == 9 && draw == true) {
      checkdraw();
    }
  }

  void checkdraw() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clearboard();
                    Navigator.of(context).pop();
                  },
                  child: Text("Played Again"))
            ],
          );
        });
  }

  void showdmessage(String winner) {
    draw = false;

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is " + winner),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clearboard();
                    Navigator.of(context).pop();
                  },
                  child: Text("Played Again"))
            ],
          );
        });
    if (winner == 'O') {
      setState(() {
        o++;
      });
    } else {
      setState(() {
        x++;
      });
    }
  }

  void clearboard() {
    setState(() {
      s = ['', '', '', '', '', '', '', '', ''];
    });

    w = 0;
  }
}
