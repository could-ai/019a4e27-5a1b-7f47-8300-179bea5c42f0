import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';

class ReferEarnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refer & Earn'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // TODO: Show referral program info
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
            // Header
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Earn More Tokens!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Share your referral code with friends and earn bonus tokens when they join MintHub.', style: TextStyle(color: Colors.white54)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('You Earn:', style: TextStyle(color: Color(0xFFFBBF24))),
                        Text('50 Tokens', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Friend Earns:', style: TextStyle(color: Color(0xFF34D399))),
                        Text('25 Tokens', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Referral Code Section
            Text('Your Referral Code', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'MINT1234',
                        style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy, color: Color(0xFFEC4899)),
                      onPressed: () {
                        // TODO: Copy to clipboard
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Referral code copied!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Share Button
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement share functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Share functionality coming soon!')),
                );
              },
              icon: Icon(Icons.share),
              label: Text('Share Referral Code'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5CF6),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            Text('Share via WhatsApp, SMS, or any other app', style: TextStyle(color: Colors.white54, fontSize: 12)),
            SizedBox(height: 32),
            // Stats
            Text('Your Referral Stats', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
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
                          Text('Friends Referred', style: TextStyle(color: Colors.white54, fontSize: 14)),
                          SizedBox(height: 8),
                          Text('5', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
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
                          Text('Tokens Earned', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 14)),
                          SizedBox(height: 8),
                          Text('250', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}