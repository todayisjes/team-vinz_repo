import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/authentication.dart';
import 'package:gumsmile/provider/signup_sharedpreferences.dart';
import 'package:gumsmile/view/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? email;
  String? password;
  String? name;

  bool agree = false;

  late SharedPreferences signupData;
  late bool newUser;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('Create Account',
                        style: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center),
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
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Username',
                        labelStyle: GoogleFonts.lexendDeca()),
                    validator: (value) {
                      if (value != null && value.length < 5) {
                        return "Enter at least 5 characters";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      name = val;
                    },
                    keyboardType: TextInputType.name,
                    style: GoogleFonts.lexendDeca(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'jessie@gmail.com',
                        labelStyle: GoogleFonts.lexendDeca()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email address";
                      } else if (!value.contains("@") || !value.contains(".")) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      email = val;
                    },
                    keyboardType: TextInputType.emailAddress,
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
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.lexendDeca()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 8) {
                        return "Length of password's characters must be 8 or greater";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      password = val;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.lexendDeca(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 2, color: Colors.black),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Confirm Password',
                        hintStyle: GoogleFonts.lexendDeca()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please re-enter your password";
                      } else if (value.length < 8) {
                        return "Length of password's characters must be 8 or greater";
                      } else if (value != _passwordController.text) {
                        return "Password mismatch";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: GoogleFonts.lexendDeca(),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: agree, 
                      onChanged: (value) {
                        setState(() {
                          agree = !agree;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text("By creating account, I agree to terms & conditions and privacy policy"),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String username = _nameController.text;
                        AuthenticationHelper().signUp(email: email!, password: password!).then((result) {
                          SignupSharedPreferences.saveUserSignUpPreference(true);
                          SignupSharedPreferences.saveUserNamePreference(username);    
                          if (result == null) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ScreenLogin()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(result, style: GoogleFonts.lexendDeca(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: const Color(0xCC3BE2EF)),
                    child: Text('Sign Up',
                        style: GoogleFonts.lexendDeca(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 12, color: Colors.black)),
                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenLogin()));
                      },
                      child: Text('Login',
                          style: GoogleFonts.lexendDeca(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _signUp() async {
    // final isValidForm = _formKey.currentState!.validate();
    // String username = _nameController.text;

    // await SignupSharedPreferences.saveUserLogInPreference(true);
    // await SignupSharedPreferences.saveUserNamePreference(username);

    // if (isValidForm) {
      // Navigator.pushAndRemoveUntil(
        // context, 
        // MaterialPageRoute(
          // builder: (_) => const NavbarScreen(),
        // ), 
        // (route) => false);
    // }
  // }
}
