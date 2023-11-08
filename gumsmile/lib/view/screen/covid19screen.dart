import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';

class Covid19Screen extends StatelessWidget {
  const Covid19Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Form"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: 400,
            height: 350,
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
                Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Registration Your Medical Test",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    // height: 130,
                    width: 310,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: kPrimaryColor,
                        label: Text("Name"),
                        hintText: "Enter Your Full Name",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            // width: 2,
                            // color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    // height: 130,
                    width: 310,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        // fillColor: kPrimaryColor,
                        label: Text("Nik"),
                        hintText: "Enter Your Nik",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            // width: 2,
                            // color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 310,
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor, shape: StadiumBorder()),
                    onPressed: (){},
                    child: Text(
                      "Save",
                      style: GoogleFonts.roboto(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}
