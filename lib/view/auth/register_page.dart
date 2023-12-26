import 'package:flutter/material.dart';
import 'package:login_app/provider/auth/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterProvider provider = Provider.of<RegisterProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Register Account'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[400],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.fNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.lNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.loginController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Login=',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            provider.register(context);
            provider.lNameController.clear();
            provider.fNameController.clear();
            provider.loginController.clear();
            provider.passwordController.clear();
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
