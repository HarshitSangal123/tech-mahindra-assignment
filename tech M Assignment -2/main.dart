import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: TicTacToeHome(),
    );
  }
}

class TicTacToeHome extends StatefulWidget {
  @override
  _TicTacToeHomeState createState() => _TicTacToeHomeState();
}

class _TicTacToeHomeState extends State<TicTacToeHome> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';
  String status = 'Player X's Turn';

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      status = 'Player X's Turn';
    });
  }

  void handleTap(int index) {
    if (board[index] != '') return;

    setState(() {
      board[index] = currentPlayer;
      if (checkWinner(currentPlayer)) {
        status = 'Player $currentPlayer Wins!';
      } else if (!board.contains('')) {
        status = 'It's a Draw!';
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        status = 'Player $currentPlayer's Turn';
      }
    });
  }

  bool checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    return winPatterns.any((pattern) =>
        pattern.every((index) => board[index] == player));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(status, style: TextStyle(fontSize: 22)),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => handleTap(index),
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child: Text(board[index],
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold)),
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: resetGame,
            child: Text('Reset Game'),
          ),
        ],
      ),
    );
  }
}