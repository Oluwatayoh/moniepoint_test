import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_test/components/locationAndPrrofilee.dart';
import 'package:moniepoint_test/components/offerr_card.dart';
import 'package:moniepoint_test/components/offers.dart';
import 'package:moniepoint_test/components/property_gridTile.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingPageState();
}

class _LandingPageState extends ConsumerState<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  double opacityLevel = 0.0;
  Offset slideOffset = const Offset(-1, 0);
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
    
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );


    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));


    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const LocationAndProfile()),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 247, 227),
              Color.fromARGB(255, 255, 253, 231),
              Color.fromARGB(255, 255, 238, 182),
              Color.fromARGB(255, 255, 201, 121),
              Color.fromARGB(255, 255, 196, 108),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SlideTransition(
            position: _slideAnimation,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
              opacity: opacityLevel,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Hi, Marina',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "let's select your perfect place",
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Offers(controller: _controller),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: PropertyImageGridScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
