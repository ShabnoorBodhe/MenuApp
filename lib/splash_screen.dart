import 'package:flutter/material.dart';
import 'package:menu_app/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

    await Future.delayed(Duration(seconds: 3));

    if (!hasSeenSplash) {
      await prefs.setBool('hasSeenSplash', true);
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/menulogo.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
