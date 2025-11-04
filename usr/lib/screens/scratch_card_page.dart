import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';
import 'package:scratcher/scratcher.dart';
import 'package:confetti/confetti.dart';

class ScratchCardPage extends StatefulWidget {
  @override
  _ScratchCardPageState createState() => _ScratchCardPageState();
}

class _ScratchCardPageState extends State<ScratchCardPage> {
  late ConfettiController _confettiController;
  bool _isScratched = false;
  String _prize = '?';
  final List<String> _prizes = ['10 Tokens', '25 Tokens', '50 Tokens', '100 Tokens', 'Try Again'];

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 2));
    _generatePrize();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _generatePrize() {
    // Simple random prize generation
    final random = DateTime.now().millisecondsSinceEpoch % _prizes.length;
    _prize = _prizes[random];
  }

  void _onScratchEnd() {
    if (!_isScratched) {
      setState(() => _isScratched = true);
      _confettiController.play();
      // TODO: Add tokens to wallet via provider
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Congratulations! You won $_prize')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch Cards'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerMenu(),
      backgroundColor: Color(0xFF0A0F1A),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Header
                Card(
                  color: Color(0xFF0B1220),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text('Try Your Luck!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Scratch the card to reveal your prize', style: TextStyle(color: Colors.white54)),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _prizeInfo('10', 'Common'),
                            _prizeInfo('25', 'Uncommon'),
                            _prizeInfo('50', 'Rare'),
                            _prizeInfo('100', 'Epic'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Scratch Card
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 200,
                      child: Scratcher(
                        brushSize: 30,
                        threshold: 50,
                        color: Colors.grey[800]!,
                        onChange: (value) => print("Scratch progress: $value%"),
                        onThreshold: _onScratchEnd,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF0B1220),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Color(0xFF8B5CF6), width: 2),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: Color(0xFFFBBF24), size: 48),
                                SizedBox(height: 16),
                                Text(
                                  'You Won',
                                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  _prize,
                                  style: TextStyle(color: Color(0xFF34D399), fontSize: 32, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                // Scratch Another Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isScratched = false;
                      _generatePrize();
                    });
                  },
                  child: Text('Scratch Another Card'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8B5CF6),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
          // Confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [Color(0xFF8B5CF6), Color(0xFFEC4899), Color(0xFFFBBF24)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _prizeInfo(String tokens, String rarity) {
    return Column(
      children: [
        Text(tokens, style: TextStyle(color: Color(0xFFFBBF24), fontWeight: FontWeight.bold)),
        Text(rarity, style: TextStyle(color: Colors.white54, fontSize: 12)),
      ],
    );
  }
}