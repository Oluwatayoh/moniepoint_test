import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moniepoint_test/widgets/custom_floating_nav_bar.dart';
import 'package:moniepoint_test/widgets/home_body.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final navbarVisibleProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends ConsumerWidget {
  final PageController _pageController = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    final navbarVisible = ref.watch(navbarVisibleProvider);
    final PageController pageController = PageController();

    void onNavBarTap(int index) {
      ref.read(bottomNavIndexProvider.notifier).state = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }

    Future.delayed(const Duration(seconds: 4), () {
      ref.read(navbarVisibleProvider.notifier).state = true;
    });

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          HomeBody(
            pageController: pageController,
            onPageChanged: (index) {
              ref.read(bottomNavIndexProvider.notifier).state = index;
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: AnimatedOpacity(
                opacity: navbarVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: CustomFloatingNavBar(
                  selectedIndex: currentIndex,
                  onTap: onNavBarTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
