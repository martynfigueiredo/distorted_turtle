import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls;
  final BoxFit boxFit; // Add this property

  // Accept BoxFit as a parameter
  CarouselWidget({required this.imageUrls, this.boxFit = BoxFit.cover}); // Default to BoxFit.cover

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0, // Set the height of the carousel widget
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,  // Set the carousel to fill the width of the screen
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              url,
              fit: boxFit,  // Apply the passed BoxFit here
              width: double.infinity,  // Ensures the image takes up the full width of the carousel
            );
          },
        );
      }).toList(),
    );
  }
}
