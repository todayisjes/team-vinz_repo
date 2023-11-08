import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/view/screen/loginscreen.dart';
import 'package:gumsmile/view/screen/navbarscreen.dart';
import 'package:gumsmile/view/screen/registerscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            // SizedBox(
            //   height: 15,
            // ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => NavbarScreen()));
            //     },
            //     child: Text(
            //       'SKIP',
            //       style: TextStyle(color: Color(0xFFFF9800), fontSize: 20),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('assets/img1.jpeg'),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              'GumSmile',
              style: GoogleFonts.poppins(
                color: Color(0xFFFF9800),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Dental Care',
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9800),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScreenLogin()));
                    },
                    child: Text(
                      'Log In',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // tambahin file login disini
                // Material(
                //   color: Color(0xFFFF9800),
                //   borderRadius: BorderRadius.circular(10),
                //   child: InkWell(
                //     onTap: () {
                //       // Navigator.push(context, MaterialPageRoute(
                //       //   builder: (context) =>
                //       // ));
                //     },
                //     child: Padding(
                //       padding:
                //           EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                //       child: Text(
                //         'Log In',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // ),
                // Material(
                //   color: Color(0xFFFF9800),
                //   borderRadius: BorderRadius.circular(10),
                //   child: InkWell(
                //     onTap: () {
                //       // Navigator.push(context, MaterialPageRoute(
                //       //   builder: (context) =>
                //       // ));
                //     },
                //     child: Padding(
                //       padding:
                //           EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                //       child: Text(
                //         'Sign Up',
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ),
                //   ),
                // )
                Container(
                  width: 150,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9800),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
