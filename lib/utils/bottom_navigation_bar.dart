import 'package:expense_tracker_app/providers/google_signin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0), // Adjust the space as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavItem(0, Icons.home_filled, 'Home', () {}),
          buildNavItem(1, Icons.swap_horiz_rounded, 'Transaction', () {}),
          const SizedBox(width: 40.0),
          buildNavItem(2, Icons.pie_chart_rounded, 'Budget', () {}),
          buildNavItem(3, Icons.logout_rounded, 'Logout', () {
            context.read<GoogleSignInProvider>().signOut();
          }),
        ],
      ),
    );
  }

  Widget buildNavItem(
      int index, IconData icon, String label, void Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28.0),
            Text(label, style: const TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
    );
  }
}
