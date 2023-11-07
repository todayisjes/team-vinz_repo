import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/provider/step1prov.dart';
import 'package:kelompokmbl/screen/bookappoint/bookappointmentstep2screen.dart';
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  bool _selectedIndex = false;
  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Step1Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Step 1 out of 4',
          style: GoogleFonts.inriaSans(
              fontSize: 13, color: Colors.black45, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The reason of the visit",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 550,
                child: GridView.builder(
                    itemCount: prov.data['data']!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      var item = prov.data['data']![index];
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _selectedIndex = true;
                          });
                        },
                        child: Card(
                          elevation: 2,
                          color: _currentIndex == index ? kPrimaryColor : Colors.grey.shade300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  item['title'].toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                child: Text(
                                  item['subtitle'].toString(),
                                  style: GoogleFonts.farro(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      ExactAssetImage(item['img'].toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == true ? kPrimaryColor : Colors.grey,
                  ),
                  onPressed: _selectedIndex ? () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Step2Screen(),
                    ),
                  ) : null,
                  
                  child: Text(
                    "Next Step",
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
