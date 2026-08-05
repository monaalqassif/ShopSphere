// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_item.dart';
// import 'package:final_project/product_screen.dart';
// import 'package:final_project/profile_screen.dart';
// import 'package:final_project/view.dart';
// import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:final_project/Home/view.dart';
import 'package:final_project/cart/view.dart';
import 'package:final_project/profile/view.dart';
import 'package:final_project/search/view.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        items: [
          CurvedNavigationBarItem(
            child: const Icon(Icons.home, size: 24, color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: const Icon(Icons.search, size: 24, color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: const Icon(Icons.shopping_bag, size: 24, color: Colors.white),
          ),
          CurvedNavigationBarItem(
            child: const Icon(Icons.person, size: 24, color: Colors.white),
          ),
        ],
        color: const Color(0xFF6055D8),
        buttonBackgroundColor: const Color(0xFF6055D8),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}