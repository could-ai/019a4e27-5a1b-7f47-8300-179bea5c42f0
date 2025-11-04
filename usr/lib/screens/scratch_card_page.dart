import 'package:flutter/material.dart';

class ScratchCardPage extends StatelessWidget {
  const ScratchCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scratch Card'),
      ),
      body: const Center(
        child: Text('Scratch Card Page'),
      ),
    );
  }
}
