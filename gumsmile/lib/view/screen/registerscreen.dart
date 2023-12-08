import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/provider/register_provider.dart';
import 'package:gumsmile/view/screen/loginscreen.dart';
import 'package:gumsmile/view/screen/navbarscreen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterProvider _registerProvider = RegisterProvider();

  String? email;
  String? password;
  String? name;

  bool agree = false;
  @override
  void dispose() {
    _registerProvider.nameController.dispose();
    _registerProvider.emailController.dispose();
    _registerProvider.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: prov.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: prov.formKey,
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
                          controller: prov.nameController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Username',
                              labelStyle: GoogleFonts.lexendDeca()),
                          validator: (value) => prov.validatorName(value),
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
                          controller: prov.emailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              hintText: 'jhondoe@gmail.com',
                              labelStyle: GoogleFonts.lexendDeca()),
                          validator: (value) => prov.validatorEmail(value),
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
                          controller: prov.passwordController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              labelStyle: GoogleFonts.lexendDeca()),
                          validator: (value) => prov.validatorPassword(value),
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
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.black),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              hintStyle: GoogleFonts.lexendDeca()),
                          validator: (value) =>
                              prov.validatorPasswordCheck(value),
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
                            child: Text(
                                "By creating account, I agree to terms & conditions and privacy policy"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        width: double.infinity,
                        height: 60.0,
                        child: Consumer<RegisterProvider>(
                          builder: (context, regProvider, child) {
                            return ElevatedButton(
                                onPressed: () async {
                                  if (regProvider.formKey.currentState!
                                      .validate()) {
                                    if (regProvider
                                            .nameController.text.isNotEmpty &&
                                        regProvider
                                            .emailController.text.isNotEmpty &&
                                        regProvider.passwordController.text
                                            .isNotEmpty) {
                                      User? user =
                                          await regProvider.checkRegister(
                                              regProvider.nameController.text,
                                              regProvider.emailController.text,
                                              regProvider
                                                  .passwordController.text);
                                      if (user != null) {
                                        debugPrint('Login Success');
                                        // ignore: use_build_context_synchronously
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const NavbarScreen()));
                                      }
                                    } else {
                                      debugPrint('please enter');
                                    }
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
                                        color: Colors.black)));
                          },
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
}
