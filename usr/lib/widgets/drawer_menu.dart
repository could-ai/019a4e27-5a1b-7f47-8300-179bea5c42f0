class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0A0F1A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0B1220),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MintHub', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Play, Win, Earn!', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white70),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to home
              },
            ),
            ListTile(
              leading: Icon(Icons.games, color: Colors.white70),
              title: Text('Games', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/games');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet, color: Colors.white70),
              title: Text('Wallet', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/wallet');
              },
            ),
            Divider(color: Colors.white12),
            ListTile(
              leading: Icon(Icons.description, color: Colors.white70),
              title: Text('Terms & Conditions', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Open web view or external link
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip, color: Colors.white70),
              title: Text('Privacy Policy', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Open web view or external link
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white70),
              title: Text('About Us', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Open web view or external link
              },
            ),
            Divider(color: Colors.white12),
            ListTile(
              leading: Icon(Icons.share, color: Colors.white70),
              title: Text('Share App', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Share app functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.white70),
              title: Text('Rate App', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Open app store
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support, color: Colors.white70),
              title: Text('Contact Support', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Contact support
              },
            ),
          ],
        ),
      ),
    );
  }
}