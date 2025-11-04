import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'dart:math';

class SnakeLadderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake & Ladder'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF0A0F1A),
      body: GameWidget(game: SnakeLadderGame()),
    );
  }
}

class SnakeLadderGame extends FlameGame {
  late Board board;
  late Player player;
  late Dice dice;
  int currentPosition = 0;
  bool gameWon = false;

  @override
  Future<void> onLoad() async {
    board = Board();
    player = Player();
    dice = Dice();

    add(board);
    add(player);
    add(dice);
  }

  void rollDice() {
    final roll = Random().nextInt(6) + 1;
    dice.showRoll(roll);
    movePlayer(roll);
  }

  void movePlayer(int steps) {
    int newPosition = currentPosition + steps;
    if (newPosition >= 100) {
      newPosition = 100;
      gameWon = true;
      // TODO: Award tokens
    }

    // Check for snakes and ladders
    newPosition = checkSnakesAndLadders(newPosition);

    currentPosition = newPosition;
    player.moveToPosition(currentPosition);
  }

  int checkSnakesAndLadders(int position) {
    // Simple snakes and ladders logic
    final Map<int, int> snakesAndLadders = {
      16: 6,   // Snake
      47: 26,  // Snake
      49: 11,  // Snake
      56: 53,  // Snake
      62: 19,  // Snake
      64: 60,  // Snake
      87: 24,  // Snake
      93: 73,  // Snake
      95: 75,  // Snake
      98: 78,  // Snake
      3: 22,   // Ladder
      5: 8,    // Ladder
      11: 26,  // Ladder
      20: 29,  // Ladder
      27: 40,  // Ladder
      35: 44,  // Ladder
      36: 57,  // Ladder
      41: 59,  // Ladder
      43: 77,  // Ladder
      50: 91,  // Ladder
      61: 79,  // Ladder
      65: 89,  // Ladder
      68: 92,  // Ladder
      71: 99,  // Ladder
    };

    return snakesAndLadders[position] ?? position;
  }
}

class Board extends Component {
  @override
  void render(Canvas canvas) {
    // Draw 10x10 grid
    final paint = Paint()..color = Colors.white24..style = PaintingStyle.stroke;
    for (int i = 0; i <= 10; i++) {
      canvas.drawLine(Offset(i * 60, 0), Offset(i * 60, 600), paint);
      canvas.drawLine(Offset(0, i * 60), Offset(600, i * 60), paint);
    }
  }
}

class Player extends CircleComponent {
  Player() : super(radius: 15, paint: Paint()..color = Colors.blue);

  void moveToPosition(int position) {
    final row = position ~/ 10;
    final col = position % 10;
    position = Vector2(col * 60 + 30, (9 - row) * 60 + 30);
  }
}

class Dice extends TextComponent {
  Dice() : super(text: '🎲', position: Vector2(650, 300), size: Vector2(50, 50));

  void showRoll(int roll) {
    text = roll.toString();
  }
}