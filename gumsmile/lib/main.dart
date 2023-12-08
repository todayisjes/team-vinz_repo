import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile/const.dart';
import 'package:gumsmile/provider/auth.dart';
import 'package:gumsmile/provider/book_apointment_provider.dart';
import 'package:gumsmile/provider/doctor_provider.dart';
import 'package:gumsmile/provider/home_provider.dart';
import 'package:gumsmile/provider/listappointment_provider.dart';
import 'package:gumsmile/provider/login_provider.dart';
import 'package:gumsmile/provider/medicalrecord_provider.dart';
import 'package:gumsmile/provider/messageprov.dart';
import 'package:gumsmile/provider/notif_provider.dart';
import 'package:gumsmile/provider/past_provider.dart';
import 'package:gumsmile/provider/register_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder<ThemeMode>(
    //   valueListenable: themeNotifier,
    //   builder: (_, ThemeMode currentMode, __) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => ListAppointmentsProvider()),
        ChangeNotifierProvider(create: (_) => PastProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => BookAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => MedicalProvider()),
        // ChangeNotifierProvider(create: (_) => FAQScreen()),
        ChangeNotifierProvider(create: (_) => NotificatioProvider()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              backgroundColor: const Color(0xFFB3F7F9),
            ),
          ),
          cardTheme: CardTheme(
            color: kPrimaryColor.withOpacity(
                  0.5,
                ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: Colors.black12,
            elevation: 3.0,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthLogin(),
      ),
    );
  }
}