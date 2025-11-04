import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetCheck extends StatelessWidget {
  final Widget child;

  InternetCheck({required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ConnectivityResult>>(
      future: Connectivity().checkConnectivity(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final result = snapshot.data!;
          if (result.contains(ConnectivityResult.none)) {
            return _noInternetWidget();
          }
        }
        return child;
      },
    );
  }

  Widget _noInternetWidget() {
    return Scaffold(
      backgroundColor: Color(0xFF0A0F1A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, color: Colors.white54, size: 80),
            SizedBox(height: 16),
            Text(
              'No Internet Connection',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Please check your connection and try again',
              style: TextStyle(color: Colors.white54),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Retry connection check
              },
              child: Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5CF6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}