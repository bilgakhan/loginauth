import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:login_app/db/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => check(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }

  void check(BuildContext context) async {
    await AuthDb().openBox();
    String? token = Hive.box('authBox').get('access_token');
    if (token != null && token.isNotEmpty) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'home',
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'register',
        (route) => false,
      );
    }
  }
}
