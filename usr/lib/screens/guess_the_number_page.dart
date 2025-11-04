import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:couldai_user_app/providers/wallet_provider.dart';
import 'package:couldai_user_app/games/guess_the_number_logic.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';

class GuessTheNumberPage extends StatefulWidget {
  @override
  _GuessTheNumberPageState createState() => _GuessTheNumberPageState();
}

class _GuessTheNumberPageState extends State<GuessTheNumberPage> {
  final GuessTheNumberGame _game = GuessTheNumberGame();
  final TextEditingController _controller = TextEditingController();
  String _message = 'I\'m thinking of a number between 1 and 100. Can you guess it?';

  @override
  void initState() {
    super.initState();
    _game.startNewGame();
  }

  void _makeGuess() {
    final guess = int.tryParse(_controller.text);
    if (guess == null || guess < 1 || guess > 100) {
      setState(() => _message = 'Please enter a valid number between 1 and 100.');
      return;
    }

    final result = _game.makeGuess(guess);
    setState(() => _message = result);

    if (_game.gameWon) {
      final reward = _game.getReward();
      Provider.of<WalletProvider>(context, listen: false).addTokens(reward);
      Future.delayed(Duration(seconds: 2), () {
        _showWinDialog(reward);
      });
    }

    _controller.clear();
  }

  void _playAgain() {
    _game.startNewGame();
    setState(() {
      _message = 'New game started! Guess a number between 1 and 100.';
    });
    _controller.clear();
  }

  void _showWinDialog(int reward) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF0B1220),
        title: Text('Congratulations!', style: TextStyle(color: Colors.white)),
        content: Text('You won $reward tokens!', style: TextStyle(color: Color(0xFFFBBF24))),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _playAgain();
            },
            child: Text('Play Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess the Number'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerMenu(),
      backgroundColor: Color(0xFF0A0F1A),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game Info Card
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.psychology, color: Color(0xFF8B5CF6), size: 48),
                    SizedBox(height: 16),
                    Text(
                      _message,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    if (_game.hint.isNotEmpty) ...[
                      SizedBox(height: 12),
                      Text(
                        _game.hint,
                        style: TextStyle(color: Color(0xFFEC4899), fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            // Input Field
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your guess',
                labelStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B5CF6)),
                ),
              ),
              style: TextStyle(color: Colors.white),
              onSubmitted: (_) => _makeGuess(),
            ),
            SizedBox(height: 24),
            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _makeGuess,
                    child: Text('Guess'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B5CF6),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _playAgain,
                    child: Text('New Game'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFFEC4899)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            // Attempts Counter
            Text(
              'Attempts: ${_game.attempts}',
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}