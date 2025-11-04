import 'package:flutter/material.dart';

class GuessTheNumberPage extends StatelessWidget {
  const GuessTheNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess The Number'),
      ),
      body: const Center(
        child: Text('Guess The Number Page'),
      ),
    );
  }
}
