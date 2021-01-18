import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

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
  var textStyle = TextStyle(color: Colors.white, fontSize: 30);
  int oScore = 0;
  int xScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
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
                          style: textStyle,
                        ),
                        Text(
                          xScore.toString(),
                          style: textStyle,
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
                          style: textStyle,
                        ),
                        Text(
                          oScore.toString(),
                          style: textStyle,
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
                        color: Colors.grey[700],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayO[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayO[index] == '') {
        displayO[index] = 'O';
      } else if (!oTurn && displayO[index] == '') {
        displayO[index] = 'X';
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
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WINNER IS ' + winner),
          actions: [
            FlatButton(
              onPressed: () {
                _clearBoaed();
                Navigator.of(context).pop();
              },
              child: Text('Play Again!'),
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
    setState(() {
      for (int i = 0; i < 9; i++) {
      displayO[i] = '';
    } 
    });
  }
}
