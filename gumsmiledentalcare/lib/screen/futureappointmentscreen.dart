import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/const.dart';
import 'package:kelompokmbl/provider/listfuture.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({super.key});

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ListFutureScreen>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(prov.list['data']!.length, (index) {
          var item = prov.list['data']![index];
          // print(item);
          // return ListTile(
          //   title: Text(
          //     item['name'].toString(),
          //     style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
          //   ),
          // );
          // return SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: Column(
          //     children: [
          //       ListTile(
          //         title: Text(
          //           item['name'].toString(),
          //           style:
          //               GoogleFonts.roboto(fontWeight: FontWeight.bold),
          //         ),
          //       )
          //     ],
          //   ),
          // );
          return Container(
              padding: EdgeInsets.symmetric(vertical: 5,),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item['name'].toString(),
                        style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          style: GoogleFonts.inriaSans(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Type of Examination:   ',
                              style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: item["type"],
                              style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundImage: ExactAssetImage(item['img'].toString()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              MdiIcons.calendarMonthOutline,
                              color: Colors.black54,
                              size: 17,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item['date'].toString(),
                              style: GoogleFonts.inriaSans(
                                  color: Colors.black45, fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              MdiIcons.clockOutline,
                              color: Colors.black54,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item['time'].toString(),
                              style: GoogleFonts.inriaSans(
                                  color: Colors.black45, fontSize: 14),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Confirmed",
                              style: GoogleFonts.inriaSans(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF4F6FA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            // child: Container(
                            //   width: 150,
                            //   padding: EdgeInsets.symmetric(vertical: 12),
                            //   decoration: BoxDecoration(
                            //       color: kPrimaryColor,
                            //       borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.inriaSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "Reschedule",
                                style: GoogleFonts.inriaSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        // )
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
          );
        }),
      ),
    );
  }
}
