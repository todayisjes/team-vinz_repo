import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/provider/build_image.dart';
import 'package:gumsmile/provider/faq_provider.dart';
import 'package:gumsmile/provider/home_provider.dart';
import 'package:gumsmile/view/screen/bookappoint/book_appointment_step1_screen.dart';
import 'package:gumsmile/view/screen/covid19screen.dart';
import 'package:gumsmile/view/screen/listappointmentscreen.dart';
import 'package:gumsmile/view/screen/medicalrecord.dart';
import 'package:gumsmile/view/screen/notification_screen.dart';
import 'package:gumsmile/view/screen/portalpasien.dart';
import 'package:gumsmile/view/screen/promoscreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController editingController = TextEditingController();
  List<FAQScreen> faqscreens = allFAQ;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final prov = Provider.of<FAQScreen>(context);
    return Consumer<HomeProvider>(builder: (context, homeProv, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationScreen()));
                    },
                    icon: const Icon(Icons.notifications_none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Align(
                        alignment: FractionalOffset.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(
                            0.1,
                          ),
                          maxRadius: 36,
                          child: Icon(Icons.person,
                              color: Colors.blueGrey[900], size: 50.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Welcome, ',
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '${homeProv.username}',
                              style: GoogleFonts.rubik(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider.builder(
                  itemCount: homeProv.images.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = homeProv.images[index];
                    return buildImage(image, index);
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    pageSnapping: false,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 940,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text(
                            'Booking and List',
                            style: GoogleFonts.kanit(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Step1Screen()));
                              },
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 124,
                                    height: 113,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      // margin: EdgeInsets.all(5.0),
                                      child: Image.asset('assets/img5.jpeg'),
                                    ),
                                  ),
                                  Container(
                                    width: 124,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            menu3,
                                            style: GoogleFonts.quicksand(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'free for first consultation',
                                            style: GoogleFonts.quicksand(
                                                fontSize: 8,
                                                color: Colors.blueGrey.shade800,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListAppointmentScreen()));
                              },
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 124,
                                    height: 113,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      // margin: EdgeInsets.all(5.0),
                                      child: Image.asset('assets/img6.jpeg'),
                                    ),
                                  ),
                                  Container(
                                    width: 124,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 8, top: 8),
                                          child: Text(
                                            menu4,
                                            style: GoogleFonts.quicksand(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'List your appointment',
                                            style: GoogleFonts.quicksand(
                                                fontSize: 8,
                                                color: Colors.blueGrey.shade800,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text(
                            'Feature and Form',
                            style: GoogleFonts.kanit(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Container(
                            // padding: EdgeInsets.only(left: 20, right: 20),
                            width: 281,
                            height: 60,
                            color: Colors.white,
                            child: ListTile(
                              //halaman code promo
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PromoScreen()));
                              },
                              leading: const Icon(Icons.discount_outlined),
                              minLeadingWidth: 10,
                              title: Text(
                                "LOOK WHAT'S PROMO IN HERE",
                                style: GoogleFonts.quicksand(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MedicalRecordScreen()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 69,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/img7.jpeg',
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    menu5,
                                    style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PortalPasien()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 69,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/img8.jpeg',
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    menu6,
                                    style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Covid19Screen()));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 69,
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/img9.jpeg',
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    menu7,
                                    style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                          ),
                          child: Text(
                            'FAQ',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          height: 44,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 10),
                                  blurRadius: 50,
                                  color: kPrimaryColor.withOpacity(0.23),
                                )
                              ]),
                          child: TextField(
                            onChanged: searchFAQ,
                            controller: editingController,
                            decoration: InputDecoration(
                                hintText: "Search your problem",
                                hintStyle: GoogleFonts.rubik(
                                  color: kPrimaryColor.withOpacity(0.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                icon: const Icon(Icons.search)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(faqscreens.length, (index) {
                                final item = faqscreens[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 3,
                                              spreadRadius: 2,
                                            ),
                                          ]),
                                      child: SizedBox(
                                        width: 350,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              onTap: () {},
                                              // tileColor: Colors.grey,
                                              leading: Icon(
                                                MdiIcons.circleSmall,
                                                color: Colors.black,
                                              ),
                                              minLeadingWidth: 10,
                                              title: Text(
                                                item.title,
                                                style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              })),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ));
    });
  }

  void searchFAQ(String query) {
    final suggestions = allFAQ.where((item) {
      final faqTitle = item.title.toLowerCase();
      final input = query.toLowerCase();

      return faqTitle.contains(input);
    }).toList();

    setState(() => faqscreens = suggestions);
  }
}
