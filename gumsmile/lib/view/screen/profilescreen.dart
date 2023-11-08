// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/provider/login_sharedpreferences.dart';
// import 'package:kelompokmbl/main.dart';
import 'package:gumsmile/view/screen/updateprofilescreen.dart';
import 'package:gumsmile/view/screen/welcomescreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  int selectIndex = 0;
  String username = '';

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  _getUserName() async {
    String? name = await LoginSharedPreferences.getUserNamePreference();
    setState(() {
      username = name!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: FractionalOffset.center,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.person, 
                          color: Colors.blueGrey[900],
                          size: 50.0),
                        backgroundColor: Colors.black.withOpacity(
                            0.1,
                          ),
                        maxRadius: 45,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$username',
                  style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  // color: Colors.black,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        side: BorderSide.none,
                        shape: StadiumBorder()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UpdateProfileScreen()));
                    },
                    child: Text(
                      textEditProfile,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(),

                // Menu
                Profilesetting(title: menu1, icon: Icons.settings, onTap: () {}),
                Profilesetting(title: menu2, icon: Icons.wallet, onTap: () {}),
                Profilesetting(title: menu8,textColor: Colors.black,icon: Icons.question_mark,onTap: () {}),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Profilesetting(
                  title: textLogoutDialog,
                  icon: Icons.logout_outlined,
                  onTap: () {
                    _logOut();
                    //Navigator.pop(context);
                  },
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

  _logOut() async {
    await LoginSharedPreferences.saveUserLogInPreference(false);
    await LoginSharedPreferences.saveUserNamePreference('');

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
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
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18.0,
                  color: bPrimaryColor,
                ),
              )
            : null);
  }
}
