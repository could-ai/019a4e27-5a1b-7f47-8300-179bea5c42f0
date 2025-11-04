import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';

class TasksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tasks'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // TODO: Refresh tasks from Firebase
            },
          ),
        ],
      ),
      drawer: DrawerMenu(),
      backgroundColor: Color(0xFF0A0F1A),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Complete tasks to earn tokens!', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 24),
            // Task List
            Expanded(
              child: ListView(
                children: [
                  _buildTaskCard(
                    icon: Icons.videogame_asset,
                    title: 'Play 3 Games',
                    description: 'Complete any 3 games today',
                    reward: '25 Tokens',
                    progress: 2,
                    total: 3,
                    isCompleted: false,
                  ),
                  SizedBox(height: 12),
                  _buildTaskCard(
                    icon: Icons.ads_click,
                    title: 'Watch Ad',
                    description: 'Watch a rewarded ad',
                    reward: '10 Tokens',
                    progress: 0,
                    total: 1,
                    isCompleted: false,
                  ),
                  SizedBox(height: 12),
                  _buildTaskCard(
                    icon: Icons.login,
                    title: 'Daily Login',
                    description: 'Log in to MintHub today',
                    reward: '5 Tokens',
                    progress: 1,
                    total: 1,
                    isCompleted: true,
                  ),
                  SizedBox(height: 12),
                  _buildTaskCard(
                    icon: Icons.share,
                    title: 'Share App',
                    description: 'Share MintHub with friends',
                    reward: '15 Tokens',
                    progress: 0,
                    total: 1,
                    isCompleted: false,
                  ),
                  SizedBox(height: 12),
                  _buildTaskCard(
                    icon: Icons.card_giftcard,
                    title: 'Scratch Card',
                    description: 'Try your luck with scratch cards',
                    reward: 'Up to 50 Tokens',
                    progress: 0,
                    total: 1,
                    isCompleted: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard({
    required IconData icon,
    required String title,
    required String description,
    required String reward,
    required int progress,
    required int total,
    required bool isCompleted,
  }) {
    return Card(
      color: Color(0xFF0B1220),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: isCompleted ? Color(0xFF34D399) : Color(0xFF8B5CF6)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(description, style: TextStyle(color: Colors.white54, fontSize: 14)),
                    ],
                  ),
                ),
                if (isCompleted)
                  Icon(Icons.check_circle, color: Color(0xFF34D399))
                else
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFBBF24),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(reward, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            if (!isCompleted) ...[
              SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress / total,
                backgroundColor: Colors.white12,
                valueColor: AlwaysStoppedAnimation(Color(0xFF8B5CF6)),
              ),
              SizedBox(height: 8),
              Text('$progress / $total completed', style: TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }
}