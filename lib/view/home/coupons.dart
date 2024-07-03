import 'package:flutter/material.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                AuthController().logout(context);
              },
              child: Text('log out'))
        ],
      )),
    );
  }
}
