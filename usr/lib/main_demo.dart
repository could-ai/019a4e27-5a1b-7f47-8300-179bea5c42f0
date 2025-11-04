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
            '/refer': (_) => ProfilePage(),
            '/tasks': (_) => TasksPage(),
          },
        ),
      ),
    );
  }
}