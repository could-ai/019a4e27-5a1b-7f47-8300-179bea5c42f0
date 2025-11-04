import 'package:flutter/material.dart';

class FlappyGamePage extends StatelessWidget {
  const FlappyGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flappy Game'),
      ),
      body: const Center(
        child: Text('Flappy Game Page'),
      ),
    );
  }
}
