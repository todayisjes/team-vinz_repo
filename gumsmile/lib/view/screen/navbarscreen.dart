import 'package:flutter/material.dart';
import 'package:gumsmile/view/screen/homescreen.dart';
import 'package:gumsmile/view/screen/messagesscreeen.dart';
import 'package:gumsmile/view/screen/profilescreen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 1;
  final _screens = [
    // Message
    const MessageScreen(),
    // Homescreen
    const HomeScreen(),
    // Profile
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF26C6DA),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded), 
              label: 'Messages'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), 
              label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
