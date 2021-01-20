import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var textStyle = TextStyle(color: Colors.white, fontSize: 60);
  int oScore = 0;
  int xScore = 0;
  int drawScore = 0;

  static var newFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var newFontWhite = GoogleFonts.vt323(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 40));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player X',
                          style: newFontWhite,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          xScore.toString(),
                          style: newFontWhite,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player O',
                          style: newFontWhite,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          oScore.toString(),
                          style: newFontWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[900],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayO[index],
                        style: GoogleFonts.ewert(
                          textStyle:
                              TextStyle(fontSize: 80, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'TIC TAC TOE',
                      style: newFontWhite,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      '@jaydroid',
                      style: newFontWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayO[index] == '') {
        displayO[index] = 'O';
        drawScore += 1;
      } else if (!oTurn && displayO[index] == '') {
        displayO[index] = 'X';
        drawScore += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // check 1st row
    if (displayO[0] == displayO[1] &&
        displayO[0] == displayO[2] &&
        displayO[0] != '') {
      _showWinDialog(
        displayO[0],
      );
    }

    // check 2nd row
    if (displayO[3] == displayO[4] &&
        displayO[3] == displayO[5] &&
        displayO[3] != '') {
      _showWinDialog(
        displayO[3],
      );
    }

    // check 3rd row
    if (displayO[6] == displayO[7] &&
        displayO[6] == displayO[8] &&
        displayO[6] != '') {
      _showWinDialog(
        displayO[6],
      );
    }

    // check 1st column
    if (displayO[0] == displayO[3] &&
        displayO[0] == displayO[6] &&
        displayO[0] != '') {
      _showWinDialog(
        displayO[0],
      );
    }

    // check 2nd column
    if (displayO[1] == displayO[4] &&
        displayO[1] == displayO[7] &&
        displayO[1] != '') {
      _showWinDialog(
        displayO[1],
      );
    }

    // check 3rd column
    if (displayO[2] == displayO[5] &&
        displayO[2] == displayO[8] &&
        displayO[2] != '') {
      _showWinDialog(
        displayO[2],
      );
    }

    // check diagonal
    if (displayO[6] == displayO[4] &&
        displayO[6] == displayO[2] &&
        displayO[6] != '') {
      _showWinDialog(
        displayO[6],
      );
    }

    // check diagonal
    if (displayO[0] == displayO[4] &&
        displayO[0] == displayO[8] &&
        displayO[0] != '') {
      _showWinDialog(
        displayO[0],
      );
    } else if (drawScore == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue[900],
          title: Center(
            child: Text(
              'DRAW',
              style: newFontWhite,
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                _clearBoaed();
                Navigator.of(context).pop();
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                  color: Colors.white,
                    child: Center(
                      child: Text(
                        'Play Again!',
                        style: newFont,
                      ),
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blue[900],
          title: Center(
            child: Text(
              'WINNER IS ' + winner,
              style: newFontWhite,
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                _clearBoaed();
                Navigator.of(context).pop();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Play Again!',
                      style: newFont,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
    // _clearBoaed
  }

  void _clearBoaed() {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          displayO[i] = '';
        }
      },
    );
    drawScore = 0;
  }
}
