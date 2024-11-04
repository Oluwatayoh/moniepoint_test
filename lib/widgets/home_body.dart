import 'package:flutter/material.dart';
import 'package:moniepoint_test/landing_page.dart';
import 'package:moniepoint_test/map.dart';

class HomeBody extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const HomeBody({super.key, required this.pageController, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: const [
        LandingPage(),
        MapScreen(),
        Center(child: Text('Message Page', style: TextStyle(fontSize: 24))),
        Center(child: Text('Favourite Page', style: TextStyle(fontSize: 24))),
        Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
      ],
    );
  }
}
