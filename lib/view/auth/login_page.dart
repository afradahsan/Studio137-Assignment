import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/auth/signup_page.dart';
import 'package:studio137_deliva/view/auth/widgets/signup_button.dart';
import 'package:studio137_deliva/view/auth/widgets/text_formfeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        return const SignupPage();
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
            const Text(
              'Log in to Continue',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            sizedten(context),
            TFormFeild(
              controller: emailController,
              label: 'Email ID',
            ),
            sizedten(context),
            TFormFeild(
              controller: passwordController,
              label: 'Password',
            ),
            sizedtwenty(context),
            SignupButton(
              onpressed: () {
                if (emailController.text != null &&
                    passwordController.text != null) {
                  AuthController().login(
                      emailController.text, passwordController.text, context);
                }
              },
              buttonText: 'Log In',
            ),
            TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?',
                    style: TextStyle(decoration: TextDecoration.underline))),
            RichText(
                text: TextSpan(
                    text: 'New Account?  ',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black.withOpacity(0.6),
                        fontSize: 12),
                    children: [
                  TextSpan(
                      recognizer: tapGestureRecognizer,
                      text: 'Register Now!',
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
