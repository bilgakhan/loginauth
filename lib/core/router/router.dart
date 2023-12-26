import 'package:flutter/material.dart';
import 'package:login_app/view/auth/register_page.dart';
import 'package:login_app/view/auth/splash_screen.dart';
import 'package:login_app/view/home_page.dart';

class RouteGenerate {
  static final RouteGenerate _router = RouteGenerate._init();
  static RouteGenerate get router => _router;
  RouteGenerate._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "home":
        return _navigate(const HomePage());
      case "register":
        return _navigate(const RegisterPage());
      case "splash":
        return _navigate(const SplashScreen());
    }
    return null;
  }

  MaterialPageRoute _navigate(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
