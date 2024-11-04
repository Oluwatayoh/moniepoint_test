import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomFloatingNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomFloatingNavBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildNavBarItem(icon: HugeIcons.strokeRoundedSearch02, index: 1),
          const SizedBox(width: 15),
          _buildNavBarItem(icon: HugeIcons.strokeRoundedMessage02, index: 2),
          const SizedBox(width: 15),
          _buildNavBarItem(icon: HugeIcons.strokeRoundedHome09, index: 0),
          const SizedBox(width: 15),
          _buildNavBarItem(icon: HugeIcons.strokeRoundedFavourite, index: 3),
          const SizedBox(width: 15),
          _buildNavBarItem(icon: HugeIcons.strokeRoundedUser, index: 4),
        ],
      ),
    );
  }

  Widget _buildNavBarItem({required IconData icon, required int index}) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.all(selectedIndex == index ? 15 : 10),
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? const Color(0xFFFC9E12)
                : Colors.black.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: HugeIcon(
            icon: icon,
            color: Colors.white,
            size: selectedIndex == index ? 30 : 25,
          )),
    );
  }
}
