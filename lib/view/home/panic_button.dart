import 'package:flutter/material.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';

class PanicButton extends StatelessWidget {
  const PanicButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                AuthController().logout(context);
              },
              child: Text('log out'))),
    );
  }
}
