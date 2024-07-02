import 'package:flutter/material.dart';
import 'package:studio137_deliva/utils/utils.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'REGISTER FOR FREE',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            sizedten(context),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              controller: usernameController,
            ),
            sizedten(context),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              controller: usernameController,
            ),
            sizedten(context),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              controller: usernameController,
            ),
            sizedtwenty(context),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(color: white, ),
                  ),
                  sizedwten(context),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: white,
                  )
                ],
              ),
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(250, 80)),
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(231, 76, 61, 1))),
            )
          ],
        ),
      )),
    );
  }
}
