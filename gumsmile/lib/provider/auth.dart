import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile/provider/home_provider.dart';
import 'package:gumsmile/view/screen/loginscreen.dart';
import 'package:gumsmile/view/screen/navbarscreen.dart';
import 'package:provider/provider.dart';

class AuthLogin extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    if (_firebaseAuth.currentUser != null) {
      context.read<HomeProvider>().setName(_firebaseAuth.currentUser!.uid);
      return const NavbarScreen();
    } else {
      return const ScreenLogin();
    }
  }
}