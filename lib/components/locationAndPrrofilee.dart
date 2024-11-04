import 'package:flutter/material.dart';

class LocationAndProfile extends StatelessWidget {
  const LocationAndProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: -40, end: 0),
          duration: const Duration(milliseconds: 1800),
          curve: Curves.easeOut,
          builder: (context, offset, child) {
            return Transform.translate(
              offset: Offset(offset, 0),
              child: AnimatedOpacity(
                opacity: offset == 0 ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1800),
                curve: Curves.linear,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        'Saint Petersburg',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.5, end: 1),
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: const AnimatedOpacity(
                duration: Duration(milliseconds: 1200),
                opacity: 1.0,
                curve: Curves.easeOut,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/property.webp'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
