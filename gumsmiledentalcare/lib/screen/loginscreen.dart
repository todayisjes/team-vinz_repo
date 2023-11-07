// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/provider/login_sharedpreferences.dart';
import 'package:kelompokmbl/screen/navbarscreen.dart';
import 'package:kelompokmbl/screen/registerscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: Image.asset('assets/loginscrenn.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Username',
                      labelStyle: GoogleFonts.lexendDeca()
                    ),
                    validator: (value) {
                      if (value != null && value.length < 5) {
                        return "Enter at least 5 characters";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    style: GoogleFonts.lexendDeca(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.lexendDeca()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please input your password";
                      } else if (value.length < 8) {
                        return "Enter min. 8 characters";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.lexendDeca(),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _logIn();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: const Color(0xCC3BE2EF)),
                    child: Text('Login',
                        style: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have any account?',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 12, color: Colors.black)),
                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                      },
                      child: Text('Register now',
                          style: GoogleFonts.lexendDeca(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            )
          )
        ),
      ),
    );
  }

  _logIn() async {
    final isValidForm = _formKey.currentState!.validate();
    String username = _nameController.text;

    await LoginSharedPreferences.saveUserLogInPreference(true);
    await LoginSharedPreferences.saveUserNamePreference(username);

    if (isValidForm) {
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(
          builder: (_) => const NavbarScreen(),
        ), 
        (route) => false);
    }
  }
}
