import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/screen/futureappointmentscreen.dart';
import 'package:kelompokmbl/screen/pastappointmentsscreen.dart';

class ListAppointmentScreen extends StatefulWidget {
  const ListAppointmentScreen({super.key});

  @override
  State<ListAppointmentScreen> createState() => _ListAppointmentScreenState();
}

class _ListAppointmentScreenState extends State<ListAppointmentScreen> {
  int _bttnIndex = 0;
  final _scheduleMenu = [
    FutureScreen(),
    PastScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Appointment"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Your Appointment",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "The List of Your Past and Future Appointment",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    color: Color(0xFFF4F6FA),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _bttnIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 35,
                        ),
                        decoration: BoxDecoration(
                          color: _bttnIndex == 0
                              ? kPrimaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Future Appointments",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _bttnIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 35,
                        ),
                        decoration: BoxDecoration(
                          color: _bttnIndex == 1
                              ? kPrimaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Past Appointments",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _scheduleMenu[_bttnIndex],
            ],
          ),
        ),
      ),
    );
  }
}
