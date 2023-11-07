import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';

class SampleChat extends StatelessWidget {
  const SampleChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: 80,
          ),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFE1E1E2),
              ),
              child: Text(
                'You can eat dessert now',
                style: GoogleFonts.kanit(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(
              top: 20,
              left: 80,
            ),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 10,
                  bottom: 25,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                child: Text(
                  'thankyou doctor',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
