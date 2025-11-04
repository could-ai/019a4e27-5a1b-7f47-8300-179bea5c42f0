import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:math';

class FlappyGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flappy Game'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF0A0F1A),
      body: GameWidget(game: FlappyBirdGame()),
    );
  }
}

class FlappyBirdGame extends FlameGame with TapDetector {
  late Bird bird;
  late PipeManager pipeManager;
  late ScoreText scoreText;
  int score = 0;

  @override
  Future<void> onLoad() async {
    bird = Bird();
    pipeManager = PipeManager();
    scoreText = ScoreText();

    add(bird);
    add(pipeManager);
    add(scoreText);
  }

  @override
  void onTap() {
    bird.jump();
  }

  void increaseScore() {
    score++;
    scoreText.updateScore(score);
  }

  void gameOver() {
    // TODO: Show game over dialog and award tokens
    pauseEngine();
  }
}

class Bird extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  double velocity = 0;
  final double gravity = 800;
  final double jumpStrength = -300;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bird.png');
    size = Vector2(50, 50);
    position = Vector2(100, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;
    position.y += velocity * dt;

    if (position.y < 0 || position.y > gameRef.size.y) {
      gameRef.gameOver();
    }
  }

  void jump() {
    velocity = jumpStrength;
  }
}

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  bool passed = false;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('pipe.png');
    size = Vector2(80, 300);
  }

  @override
  void update(double dt) {
    position.x -= 200 * dt;

    if (position.x < -size.x) {
      removeFromParent();
    }

    if (!passed && position.x < gameRef.bird.position.x) {
      passed = true;
      gameRef.increaseScore();
    }
  }
}

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  Timer pipeTimer = Timer(2, repeat: true);

  @override
  void onMount() {
    pipeTimer.onTick = spawnPipe;
    pipeTimer.start();
  }

  void spawnPipe() {
    final pipeTop = Pipe()..position = Vector2(gameRef.size.x, Random().nextDouble() * 200);
    final pipeBottom = Pipe()..position = Vector2(gameRef.size.x, pipeTop.position.y + 400);
    pipeBottom.flipVertically();

    gameRef.add(pipeTop);
    gameRef.add(pipeBottom);
  }
}

class ScoreText extends TextComponent {
  ScoreText() : super(text: '0', position: Vector2(20, 20));

  void updateScore(int score) {
    text = score.toString();
  }
}