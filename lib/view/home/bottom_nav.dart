import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studio137_deliva/view/home/coupons.dart';
import 'package:studio137_deliva/view/home/emergency_services.dart';
import 'package:studio137_deliva/view/home/messages_page.dart';
import 'package:studio137_deliva/view/home/panic_button.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> pages = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      const Coupons(),
      const EmergencyServices(),
      const MessagesPage(),
      const PanicButton()
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 10,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w400),
        unselectedLabelStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w400),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/discount.png',
              height: 25,
            ),
            activeIcon: Image.asset(
              'assets/discount.png',
              height: 25,
            ),
            label: 'Coupons',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/sos.png',
              height: 25,
            ),
            activeIcon: Image.asset(
              'assets/sos.png',
              height: 25,
            ),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/chat.png',
              height: 25,
            ),
            activeIcon: Image.asset(
              'assets/chat.png',
              height: 25,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/circle.png',
              height: 25,
            ),
            activeIcon: Image.asset(
              'assets/circle.png',
              height: 25,
            ),
            label: 'Panic Button',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
