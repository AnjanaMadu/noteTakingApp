import 'package:flutter/material.dart';
import '../shared/auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 4,
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.login),
          onPressed: () {
            signInAnonymously();
          },
          label: const Text('Login Anonymously'),
        ),
      ),
    );
  }
}
