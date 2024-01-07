import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
     color: Colors.purple,
     
      child: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: GNav(
          tabBorderRadius: 24,
          backgroundColor: Colors.purple,
          hoverColor: Colors.white,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.purpleAccent,
          padding: const EdgeInsets.all(16),
          gap: 8,

          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Jobs",
            ),
            GButton(
              icon: Icons.message,
              text: "Chat",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile Page",
            ),
            GButton(
              icon: Icons.work,
              text: "Employees",
            ),
          ],
        ),
      ),
    );
  }
}
