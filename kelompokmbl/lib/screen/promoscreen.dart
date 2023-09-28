import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text("Code Promo"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Claim The Promo Here',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 20, wordSpacing: 2),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PromoMenu(
                price: "Rp. 250.000",
                text: "for Prophylaxis Treatment",
                exp: "Exp. 15-06-2023",
                onTap: () {}),
            PromoMenu(
                price: "Rp. 200.000",
                text: "for Whitening Treatment",
                exp: "Exp. 15-06-2023",
                onTap: () {}),
            PromoMenu(
                price: "Rp. 250.000",
                text: "for Orthodentics Treatment Brace 1",
                exp: "Exp. 15-06-2023",
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class PromoMenu extends StatelessWidget {
  const PromoMenu({
    super.key,
    required this.price,
    required this.text,
    required this.exp,
    required this.onTap,
  });

  final String price;
  final String text;
  final String exp;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 155,
        width: 500,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          color: Color(0xFFE0F7FA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                price,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.symmetric(vertical: ),
              child: Text(
                text,
                style: GoogleFonts.roboto(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
            ),
            Divider(
              // height: 1,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    exp,
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor, shape: StadiumBorder()),
                    onPressed: onTap,
                    child: Text(
                      "Claim",
                      style: GoogleFonts.roboto(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
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
