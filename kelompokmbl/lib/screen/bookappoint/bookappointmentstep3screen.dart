import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/screen/bookappoint/bookappointmentstep4screen.dart';

class BookAppointmentStep3Screen extends StatefulWidget {
  const BookAppointmentStep3Screen({super.key});

  @override
  State<BookAppointmentStep3Screen> createState() => _BookAppointmentStep3ScreenState();
}

class _BookAppointmentStep3ScreenState extends State<BookAppointmentStep3Screen> {
  String itemSelected = 'Select A Doctor';
  List items = [
    'Select A Doctor',
    'Drg. Jessie Ramsley',
    'Drg. Thalia Smith',
    'Drg. Zoe Adam',
    'Drg. Josh Alexander',
    'Drg. Xavierra Ailen',
    'Drg. Zein Aldebaran'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step 3 out of 4",
            style: GoogleFonts.inriaSans(
                fontSize: 13,
                color: Colors.black45,
                fontWeight: FontWeight.w800)),
        centerTitle: true,
        // elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      backgroundColor: const Color(0xFFB3F7F9),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 13, left: 13, right: 13, bottom: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(0, 5), blurRadius: 5.0)
          ],
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text('Registration Form',
                        style: GoogleFonts.lexendDeca(
                            fontSize: 23, color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text('Name',
                      style: GoogleFonts.josefinSans(
                          fontSize: 14, color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            constraints: const BoxConstraints(
                                maxWidth: 160, maxHeight: 60),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB3F7F9), width: 1.5)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB4B4B4), width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB4B4B4), width: 1.0)),
                            helperText: 'First Name',
                            helperStyle: GoogleFonts.josefinSans(
                                color: const Color(0xFF454545), fontSize: 9)),
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.josefinSans(fontSize: 12),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            constraints: const BoxConstraints(
                                maxWidth: 160, maxHeight: 60),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB3F7F9), width: 1.5)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB4B4B4), width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFFB4B4B4), width: 1.0)),
                            helperText: 'Last Name',
                            helperStyle: GoogleFonts.josefinSans(
                                color: const Color(0xFF454545), fontSize: 9)),
                        keyboardType: TextInputType.name,
                        style: GoogleFonts.josefinSans(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Text('Phone Number',
                      style: GoogleFonts.josefinSans(
                          fontSize: 14, color: Colors.black)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        constraints:
                            const BoxConstraints(maxWidth: 340, maxHeight: 60),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB3F7F9), width: 1.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        labelText: 'Phone Number',
                        labelStyle: GoogleFonts.josefinSans(
                            fontSize: 12, color: const Color(0xFF858585))),
                    keyboardType: TextInputType.phone,
                    style: GoogleFonts.josefinSans(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('Address',
                      style: GoogleFonts.josefinSans(
                          fontSize: 14, color: Colors.black)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        constraints:
                            const BoxConstraints(maxWidth: 340, maxHeight: 60),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB3F7F9), width: 1.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        labelText: 'Enter Your Address',
                        labelStyle: GoogleFonts.josefinSans(
                            fontSize: 12, color: const Color(0xFF858585))),
                    keyboardType: TextInputType.streetAddress,
                    style: GoogleFonts.josefinSans(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('Age',
                      style: GoogleFonts.josefinSans(
                          fontSize: 14, color: Colors.black)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        constraints:
                            const BoxConstraints(maxWidth: 340, maxHeight: 60),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB3F7F9), width: 1.5)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: const BorderSide(
                                color: Color(0xFFB4B4B4), width: 1.0)),
                        labelText: 'Enter Your Age',
                        labelStyle: GoogleFonts.josefinSans(
                            fontSize: 12, color: const Color(0xFF858585))),
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.josefinSans(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text('Select A Doctor',
                      style: GoogleFonts.josefinSans(
                          fontSize: 14, color: Colors.black)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: DropdownButton(
                    items: items.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    value: itemSelected,
                    onChanged: (val) {
                      setState(() {
                        itemSelected = val as String;
                      });
                    },
                    borderRadius: BorderRadius.circular(3.0),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    elevation: 0,
                    style: GoogleFonts.josefinSans(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB3F7F9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 100),
                              elevation: 0),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const BookAppointmentStep4Screen()));
                          },
                          child: Text(
                            'Proceed To Pay',
                            style: GoogleFonts.josefinSans(
                                fontSize: 14, color: Colors.black),
                          ))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
