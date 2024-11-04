import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String offers;
  final Color color;
  final bool isOval;

  const OfferCard(
      {super.key,
      required this.title,
      required this.offers,
      required this.color,
      required this.isOval});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width / 2.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(isOval ? 500 : 20),
      ),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 15,
                  color: isOval
                      ? Colors.white
                      : const Color.fromARGB(255, 150, 132, 106))),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              offers,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: isOval
                      ? Colors.white
                      : const Color.fromARGB(255, 150, 132, 106)),
            ),
          ),
          Text(
            "offers",
            style: TextStyle(
                fontSize: 15,
                color: isOval
                    ? Colors.white
                    : const Color.fromARGB(255, 150, 132, 106)),
          ),
        ],
      ),
    );
  }
}
