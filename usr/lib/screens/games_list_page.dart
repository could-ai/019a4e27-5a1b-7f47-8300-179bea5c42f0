import 'package:flutter/material.dart';

class GamesListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final games = [
      {'title': 'Guess the Number', 'desc': 'Win up to 50 tokens!', 'route': '/'},
      {'title': 'Flappy Game', 'desc': 'Earn for your score!', 'route': '/'},
      {'title': 'Snake & Ladder', 'desc': 'Play with friends!', 'route': '/'},
    ];
    return Scaffold(
      appBar: AppBar(title: Text('All Games'), backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: Color(0xFF0A0F1A),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: games.length,
        separatorBuilder: (_, __) => SizedBox(height: 12),
        itemBuilder: (context, i) {
          final g = games[i];
          return Card(
            color: Color(0xFF0B1220),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.videogame_asset, color: Color(0xFF8B5CF6)),
              title: Text(g['title']!, style: TextStyle(fontWeight: FontWeight.w800)),
              subtitle: Text(g['desc']!, style: TextStyle(color: Colors.white54)),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: hook up game engines (Flame) here. For now show demo.
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Launching ${g['title']} (demo)')));
                },
                child: Text('Play Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B5CF6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}