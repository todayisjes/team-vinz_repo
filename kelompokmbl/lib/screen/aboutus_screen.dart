import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/provider/aboutus_provider.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AboutUsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: 14,
                ),
                child: Text(
                  'ABOUT TEAM 7',
                  style: GoogleFonts.merriweatherSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Image.asset(
                  'assets/foto1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                // color: Colors.black38,
                alignment: Alignment.center,
                child: Text(
                  'GUMSMILE DENTAL CARE',
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    color: kPrimaryColor,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 4,
                  ),
                ]),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "A dental clinic that applies modern concepts from making appointments to communication between doctors and patients. This clinic has six experienced dentists who make this clinic different from others because this clinic provides access for you to see your medical records after treatment at this clinic, no more waiting at the clinic and confused about choosing a doctor, can directly cancel the appointment without having to come to the place",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 20),
              //   child: Text("We're "),
              // )
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  'Meet Our Team',
                  style: GoogleFonts.merriweatherSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: prov.data['data']!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item = prov.data['data']![index];
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              height: 180,
                              width: 180,
                              child: Image.asset(
                                item['img'].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              // color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10.0,
                                      top: 10.0,
                                    ),
                                    child: Text(
                                      "Nim    :  ${item['nim'].toString()}",
                                      style: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10.0,
                                    ),
                                    child: Text(
                                      "Nama :  ${item['name'].toString()}",
                                      style: GoogleFonts.quicksand(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
