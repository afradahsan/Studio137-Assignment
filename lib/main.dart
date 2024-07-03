import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:studio137_deliva/controller/auth_controller.dart';
import 'package:studio137_deliva/firebase_options.dart';
import 'package:studio137_deliva/view/auth/signup_page.dart';
import 'package:studio137_deliva/view/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => AuthController())],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
