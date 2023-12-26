import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_app/core/router/router.dart';
import 'package:login_app/provider/auth/register_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerate.router.onGenerate,
      initialRoute: "register",
    );
  }
}
