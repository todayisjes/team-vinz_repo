import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelompokmbl/provider/notif_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<NotificatioProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Notifications',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Mark as read',
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                // color: Colors.black12,
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: prov.notif['data']!.length,
                  itemBuilder: (context, index) {
                    var item = prov.notif['data']![index];
                    return ListTile(
                      onTap: (){
                        
                      },
                      // selectedColor: Color(0xCC3BE2EF),
                      leading: Icon(
                        MdiIcons.bellRing,
                        color: kPrimaryColor,
                      ),
                      minLeadingWidth: 10,
                      horizontalTitleGap: 10,

                      title: Text(
                        item['text'].toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        item['subtitle'].toString(),
                        style: GoogleFonts.montserrat(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(thickness: 2, color: kPrimaryColor,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
