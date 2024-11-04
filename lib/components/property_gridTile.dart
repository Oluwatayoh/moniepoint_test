

import 'package:flutter/material.dart';
import 'package:moniepoint_test/components/properties_image_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PropertyImageGridScreen extends StatelessWidget {
  final List<Map<String, String>> images = [
    {'url': 'assets/images/property.png', 'name': 'Gladkova St., 25'},
    {'url': 'assets/images/p1.jpg', 'name': 'Park Lane, 10'},
    {'url': 'assets/images/p2.jpg', 'name': 'Downtown Ave., 3'},
    {'url': 'assets/images/p3.jpg', 'name': 'Downtown Ave., 3'},
  ];

  PropertyImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyImageCards = images
        .where((image) => image['url'] != null)
        .map((image) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: PropertyImageCard(
                  imageUrl: image['url']!, imageName: image['name']!),
            ))
        .toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PropertyImageCard(
              imageUrl: images[0]['url']!, imageName: images[0]['name']!),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: propertyImageCards.length,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => propertyImageCards[index],
            ),
          ),
        ],
      ),
    );
  }
}
