import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/view/screen/samplechat.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: kPrimaryColor,
          leadingWidth: 30,
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: ExactAssetImage('assets/dokter/doctorimg3.jpeg'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(
                    'Drg. Zoe Adam',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                right: 5,
              ),
              child: IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+21(923-456)');
                },
                icon: Icon(
                  MdiIcons.phone,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                right: 20,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.videoOutline,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                right: 20,
              ),
              child: Icon(
                MdiIcons.dotsVertical,
                color: Colors.white,
                size: 26,
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 80),
        itemBuilder: (context, index) => SampleChat(),
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 10,
          )
        ]),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                MdiIcons.plus,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                MdiIcons.emoticonHappyOutline,
                color: Colors.amber,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width / 1.6,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type something',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                MdiIcons.send,
                size: 30,
                color: kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
