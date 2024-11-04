import 'package:flutter/material.dart';

class PropertyImageCard extends StatefulWidget {
  final String imageUrl;
  final String imageName;
  final bool isLandscape;

  const PropertyImageCard({
    super.key,
    required this.imageUrl,
    required this.imageName,
    this.isLandscape = false,
  });

  @override
  _PropertyImageCardState createState() => _PropertyImageCardState();
}

class _PropertyImageCardState extends State<PropertyImageCard>
    with SingleTickerProviderStateMixin {
  bool _isNameVisible = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  void _toggleNameVisibility() {
    setState(() {
      _isNameVisible = !_isNameVisible;
    });
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Positioned(
          right: 16,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggleNameVisibility,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 26, 26),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
