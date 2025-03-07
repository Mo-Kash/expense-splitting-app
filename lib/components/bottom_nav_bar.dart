import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {

  void Function(int)? onTabChange;

  BottomNavBar({
    super.key,
    required this.onTabChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 50),
      child: GNav(
          color: Colors.grey[600],
          activeColor: Colors.white,
          tabBackgroundColor: Colors.teal,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 50,
          onTabChange: onTabChange,
          tabs: [
            GButton(
              icon: Icons.group,
              text: 'Groups',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            GButton(
              icon: Icons.account_balance_wallet,
              text: 'Expenses',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
            GButton(
              icon: Icons.show_chart,
              text: 'Activity',
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            ),
          ]
      ),
    );
  }
}
