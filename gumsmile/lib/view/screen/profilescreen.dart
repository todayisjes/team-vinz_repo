import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/provider/home_provider.dart';
import 'package:gumsmile/service/firebase_service.dart';
import 'package:gumsmile/view/screen/updateprofilescreen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: GoogleFonts.roboto(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                // IconButton(
                //   onPressed: () {
                //     Get.isDarkMode
                //         ? Get.changeTheme(ThemeData.light())
                //         : Get.changeTheme(ThemeData.dark());
                //     // MyApp.themeNotifier.value =
                //     //     MyApp.themeNotifier.value == ThemeMode.light
                //     //         ? ThemeMode.dark
                //     //         : ThemeMode.light;
                //   },
                //   icon: Icon(Icons.lightbulb),
                // Icon(MyApp.themeNotifier.value == ThemeMode.light
                //     ? Icons.dark_mode
                //     : Icons.light_mode),
                //   ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: FractionalOffset.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(
                            0.1,
                          ),
                        maxRadius: 45,
                        child: Icon(
                          Icons.person, 
                          color: Colors.blueGrey[900],
                          size: 50.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<HomeProvider>(
                  builder: (context, profileProv, _) {
                    return Text(
                      '${profileProv.username}', style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    );
                  }
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  // color: Colors.black,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UpdateProfileScreen()));
                    },
                    child: const Text(
                      textEditProfile,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),

                // Menu
                Profilesetting(title: menu1, icon: Icons.settings, onTap: () {}),
                Profilesetting(title: menu2, icon: Icons.wallet, onTap: () {}),
                Profilesetting(title: menu8,textColor: Colors.black,icon: Icons.question_mark,onTap: () {}),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Profilesetting(
                  title: textLogoutDialog,
                  icon: Icons.logout_outlined,
                  onTap: () => FirebaseService().logOut(context),
                  textColor: Colors.red.shade800,
                  endIcon: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Profilesetting extends StatelessWidget {
  const Profilesetting({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    // MyApp.themeNotifier.value == ThemeMode.light
    //     ? Icons.dark_mode
    //     : kPrimaryColor;
    return ListTile(
        onTap: onTap,
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: aPrimaryColor.withOpacity((0.1))),
          child: Icon(
            icon,
            color: bPrimaryColor,
          ),
        ),
        title: Text(
          title,
          style: GoogleFonts.rubik(fontWeight: FontWeight.w600)
              .apply(color: textColor),
        ),
        trailing: endIcon
            ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: aPrimaryColor.withOpacity(0.1)),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.0,
                  color: bPrimaryColor,
                ),
              )
            : null);
  }
}
