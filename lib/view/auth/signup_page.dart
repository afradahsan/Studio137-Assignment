import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/auth/login_page.dart';
import 'package:studio137_deliva/view/auth/widgets/signup_button.dart';
import 'package:studio137_deliva/view/auth/widgets/text_formfeild.dart';

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
        return const LoginPage();
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
              'REGISTER NOW!',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            sizedten(context),
            TFormFeild(
              controller: usernameController,
              label: 'Full Name',
            ),
            sizedten(context),
            TFormFeild(
              controller: emailController,
              label: 'Email Adress',
            ),
            sizedten(context),
            TFormFeild(
              controller: passwordController,
              label: 'Password',
            ),
            sizedtwenty(context),
            SignupButton(
              onpressed: () {
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
              buttonText: 'REGISTER',
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
