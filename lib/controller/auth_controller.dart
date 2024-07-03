import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studio137_deliva/model/user_model.dart';
import 'package:studio137_deliva/view/auth/login_page.dart';
import 'package:studio137_deliva/view/home/coupons.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserModel? _user;

  UserModel? get user => _user;

  Future signupUser(String userName, String email, String password,
      BuildContext context) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      _user = UserModel(
          uid: userCredential.user?.uid,
          email: userCredential.user?.email,
          password: password,
          userName: userName);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return Coupons();
        },
      ));

      await saveUserIdToLocal(_user!.uid!);
      notifyListeners();
    } catch (e) {
      debugPrint('errpr: $e');
    }
  }

  Future login(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      _user = UserModel(
          uid: userCredential.user!.uid, email: userCredential.user!.email);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return Coupons();
        },
      ));

      await saveUserIdToLocal(_user!.uid!);
      notifyListeners();
    } on Exception catch (e) {
      debugPrint('error: $e');
    }
  }

  Future<void> saveUserIdToLocal(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<bool> isUserSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('userId');
  }

  Future<void> checkIfUserIsLoggedIn() async {
    final isSignedIn = await isUserSignedIn();
    if (isSignedIn) {
      notifyListeners();
    }
  }

  Future logout(BuildContext context) async {
    auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      },
    ));
  }
}
