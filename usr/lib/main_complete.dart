import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:couldai_user_app/providers/wallet_provider.dart';
import 'package:couldai_user_app/widgets/internet_check.dart';
import 'package:couldai_user_app/screens/splash_screen.dart';
import 'package:couldai_user_app/screens/main_screen.dart';
import 'package:couldai_user_app/screens/games_list_page.dart';
import 'package:couldai_user_app/screens/scratch_card_page.dart';
import 'package:couldai_user_app/screens/wallet_page.dart';
import 'package:couldai_user_app/screens/profile_page.dart';
import 'package:couldai_user_app/screens/refer_earn_page.dart';
import 'package:couldai_user_app/screens/tasks_page.dart';

class MintHubDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalletProvider(),
      child: InternetCheck(
        child: MaterialApp(
          title: 'MintHub Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Color(0xFF0A0F1A),
            textTheme: GoogleFonts.ptSansTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme,
          ),
        ),
          home: SplashScreen(),
          routes: {
            '/home': (_) => MainScreen(),
            '/games': (_) => GamesListPage(),
            '/scratch': (_) => ScratchCardPage(),
            '/wallet': (_) => WalletPage(),
            '/profile': (_) => ProfilePage(),
            '/refer': (_) => ReferEarnPage(),
            '/tasks': (_) => TasksPage(),
          },
        ),
      ),
    );
  }
}

class HomeShell extends StatefulWidget {
  @override
  _HomeShellState createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;
  final pages = [
    HomePage(),
    GamesListPage(),
    WalletPage(),
    ProfilePage(),
    ReferEarnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFF071018),
          border: Border(top: BorderSide(color: Colors.white12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Home', 0),
            _navItem(Icons.videogame_asset, 'Games', 1),
            _navItem(Icons.account_balance_wallet, 'Wallet', 2),
            _navItem(Icons.person, 'Profile', 3),
            _navItem(Icons.group, 'Refer', 4),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int idx) {
    final selected = idx == _selectedIndex;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = idx),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: selected ? Color(0xFF8B5CF6) : Colors.white54),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: selected ? Color(0xFF8B5CF6) : Colors.white54)),
        ],
      ),
    );
  }
}