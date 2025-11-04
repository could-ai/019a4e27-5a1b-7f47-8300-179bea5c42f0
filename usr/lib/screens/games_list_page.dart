import 'package:flutter/material.dart';

class GamesListPage extends StatelessWidget {
  const GamesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Games'),
      ),
      body: const Center(
        child: Text('Games List Page'),
      ),
    );
  }
}
