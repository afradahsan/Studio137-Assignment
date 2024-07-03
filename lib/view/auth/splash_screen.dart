import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/controller/permission_controller.dart';
import 'package:studio137_deliva/utils/utils.dart';
import 'package:studio137_deliva/view/auth/signup_page.dart';
import 'package:studio137_deliva/view/home/coupons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkPermissions = false;

  @override
  void initState() {
    isUserSignedIn();
    super.initState();
  }

  isUserSignedIn() async {
    final authController = AuthController();
    final isSignedIn = await authController.isUserSignedIn();

    Timer(const Duration(milliseconds: 1000), () async {
      if (isSignedIn) {
        setState(() {
          checkPermissions = true;
        });
        checkUserConnection();
        await determinePosition();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return Coupons();
          },
        ));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const SignupPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromRGBO(6, 122, 252, 1),
            Color.fromRGBO(27, 32, 236, 1)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/deliva_logo.png',
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                width: screenWidth(context) - 150,
                animation: true,
                lineHeight: 6.0,
                barRadius: Radius.circular(5),
                animationDuration: 2000,
                percent: 1,
                progressColor: white,
                backgroundColor: white.withOpacity(0.4),
              ),
            ),
            checkPermissions
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingAnimationWidget.hexagonDots(
                          color: white, size: 20),
                      sizedwten(context),
                      Text(
                        'Checking Network',
                        style: TextStyle(color: white),
                      )
                    ],
                  )
                : sizedfive(context)
          ],
        )),
      ),
    );
  }
}
