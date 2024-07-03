import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/auth/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TapGestureRecognizer? tapGestureRecognizer;

  @override
  void initState() {
    tapGestureRecognizer = TapGestureRecognizer()..onTap = handletap;
    super.initState();
  }

  @override
  void dispose() {
    tapGestureRecognizer!.dispose();
    super.dispose();
  }

  void handletap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                  fontWeight: FontWeight.bold,
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
              controller: emailController,
            ),
            sizedten(context),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
              controller: passwordController,
            ),
            sizedtwenty(context),
            ElevatedButton(
              onPressed: () {
                if (usernameController.text != null &&
                    emailController.text != null &&
                    passwordController.text != null) {
                  AuthController().signupUser(
                      usernameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      context);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'REGISTER',
                    style: TextStyle(color: white, fontWeight: FontWeight.w500),
                  ),
                  sizedwten(context),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: white,
                    size: 20,
                  )
                ],
              ),
              style: ButtonStyle(
                  maximumSize: WidgetStatePropertyAll(Size(250, 80)),
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromRGBO(231, 76, 61, 1))),
            ),
            sizedten(context),
            RichText(
                text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 12),
                    children: [
                  TextSpan(
                      recognizer: tapGestureRecognizer,
                      text: 'Log In',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          decoration: TextDecoration.underline))
                ]))
          ],
        ),
      )),
    );
  }
}
