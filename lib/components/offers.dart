import 'package:flutter/material.dart';
import 'package:moniepoint_test/components/offerr_card.dart';

class Offers extends StatefulWidget {
  final AnimationController controller;

  const Offers({super.key, required this.controller});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  late Animation<int> _counterAnimation;
  late Animation<int> _counter2Animation;

  final int targetNumber = 1500;
  final int target2Number = 2300;

  @override
  void initState() {
    super.initState();

    _counterAnimation = IntTween(begin: 0, end: targetNumber).animate(
        CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    _counter2Animation = IntTween(begin: 0, end: target2Number).animate(
        CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    widget.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OfferCard(
          isOval: true,
          title: 'BUY',
          offers: "${_counterAnimation.value}",
          color: const Color.fromARGB(255, 252, 158, 18),
        ),
        OfferCard(
          isOval: false,
          title: 'RENT',
          offers: "${_counter2Animation.value}",
          color: const Color.fromARGB(255, 254, 250, 246),
        ),
      ],
    );
  }
}
