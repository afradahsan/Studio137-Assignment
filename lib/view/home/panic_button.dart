import 'package:flutter/material.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';

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
              style: const ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(250, 80)),
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(231, 76, 61, 1))),
              child: Text(
                'Log out',
                style: TextStyle(color: white),
              ))),
    );
  }
}
