import 'package:flutter/material.dart';
import 'package:login_app/view/auth/register_page.dart';
import 'package:login_app/view/home_page.dart';

class RouteGenerate {
  static final RouteGenerate _router = RouteGenerate._init();
  static RouteGenerate get router => _router;
  RouteGenerate._init();

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigate(const HomePage());
      case "register":
        return _navigate(const RegisterPage());
    }
    return null;
  }

  MaterialPageRoute _navigate(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
