import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/drawer_menu.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // TODO: Show transaction history
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
            // Balance Card
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tokens', style: TextStyle(color: Color(0xFFFBBF24), fontSize: 16)),
                            Text('${walletProvider.tokens}', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Cash Value', style: TextStyle(color: Color(0xFF34D399), fontSize: 16)),
                            Text('₹${walletProvider.rupees.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('10 Tokens = ₹1', style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Redeem Rewards', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            // Redeem Section
            Card(
              color: Color(0xFF0B1220),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter token amount',
                        labelStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement redemption logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Redemption feature coming soon!')),
                        );
                      },
                      child: Text('Redeem Now'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8B5CF6),
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('Redeem via UPI or Paytm Wallet', style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}