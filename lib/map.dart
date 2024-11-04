import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hugeicons/hugeicons.dart';
import 'package:moniepoint_test/components/map_component.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _menuController;

  late Animation<Offset> _searchBarAnimation;
  late Animation<Offset> _chatButtonAnimation;
  late Animation<Offset> _listButtonAnimation;
  late Animation<double> _menuAnimation;

  bool _isMenuOpen = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _menuController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _searchBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _chatButtonAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _listButtonAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _menuAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _menuController,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
    if (_isMenuOpen) {
      _menuController.forward();
    } else {
      _menuController.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _menuController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _isMenuOpen ? _toggleMenu : null,
                child: Container(
                  child: Center(child: MapWidget()),
                ),
              ),
            ),

            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: SlideTransition(
                position: _searchBarAnimation,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedSearch02,
                                color: Colors.black87,
                                size: 20,
                              ),
                              SizedBox(
                                  width:
                                      8), // Space between icon and text field
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Saint Petersburg...",
                                    hintStyle: TextStyle(color: Colors.black87),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: HugeIcon(
                            icon: HugeIcons.strokeRoundedFilterVertical,
                            color: Colors.black87,
                            size: 20,
                          ),
                          onPressed: () {
                            // Add filter functionality here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Chat button at the bottom left
            Positioned(
              bottom: 120,
              left: 40,
              child: SlideTransition(
                position: _chatButtonAnimation,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedDatabase02,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      onPressed: _toggleMenu,
                      icon: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedCursor02,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (_isMenuOpen)
              Positioned(
                bottom: _isMenuOpen ? 200 : 70,
                left: 40,
                child: ScaleTransition(
                  scale: _menuAnimation,
                  alignment: Alignment.bottomCenter,
                  child: FadeTransition(
                    opacity: _menuAnimation,
                    child: Container(
                      width: 180,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F4E3),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildMenuItem(HugeIcons.strokeRoundedSecurityCheck,
                              "Cosy areas", Colors.black),
                          _buildMenuItem(HugeIcons.strokeRoundedWallet01,
                              "Price", Colors.orange),
                          _buildMenuItem(HugeIcons.strokeRoundedDelete03,
                              "Infrastructure", Colors.black),
                          _buildMenuItem(HugeIcons.strokeRoundedLayers01,
                              "Without any layer", Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            Positioned(
              bottom: 120,
              right: 20,
              child: SlideTransition(
                position: _listButtonAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedCheckList,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "List of Variants",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color iconColor) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: Colors.grey[850], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
