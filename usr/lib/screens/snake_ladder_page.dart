import 'package:flutter/material.dart';

class SnakeLadderPage extends StatelessWidget {
  const SnakeLadderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake & Ladder'),
      ),
      body: const Center(
        child: Text('Snake & Ladder Page'),
      ),
    );
  }
}
