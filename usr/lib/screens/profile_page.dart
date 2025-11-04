import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit profile
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
            // Profile Header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF8B5CF6),
                    child: Text('U', style: TextStyle(fontSize: 40, color: Colors.white)),
                  ),
                  SizedBox(height: 16),
                  Text('User Name', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('user@example.com', style: TextStyle(color: Colors.white54)),
                ],
              ),
            ),
            SizedBox(height: 32),
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Color(0xFF0B1220),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Total Tokens', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 14)),
                          SizedBox(height: 8),
                          Text('1,250', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Color(0xFF0B1220),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Total Earnings', style: TextStyle(color: Color(0xFF34D399), fontSize: 14)),
                          SizedBox(height: 8),
                          Text('₹125.00', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Joined On', style: TextStyle(color: Colors.white54)),
                      Text('Jan 2024', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
            ),
            SizedBox(height: 32),
            // Action Buttons
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to edit profile
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Edit profile coming soon!')),
                );
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5CF6),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // TODO: Implement logout
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logout functionality coming soon!')),
                );
              },
              child: Text('Logout'),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color(0xFFEC4899)),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // TODO: Navigate to contact support
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Contact support coming soon!')),
                );
              },
              child: Text('Contact Support'),
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}