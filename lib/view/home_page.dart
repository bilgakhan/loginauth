import 'package:flutter/material.dart';
import 'package:login_app/db/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await AuthDb().openBox();
          await AuthDb().deleteToken();
          Navigator.pushNamedAndRemoveUntil(
              context, 'register', (route) => false);
        },
        label: const Text('Log Out'),
        backgroundColor: Colors.deepPurple[300],
      ),
    );
  }
}
