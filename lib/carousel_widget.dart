import 'package:flutter/material.dart'; // For Material widgets and BoxFit
import 'package:carousel_slider/carousel_slider.dart'; // For CarouselSlider


class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls;
  final BoxFit boxFit;

  CarouselWidget({required this.imageUrls, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1.0,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              url, // Use Image.asset for local images
              fit: boxFit,
              width: double.infinity,
            );
          },
        );
      }).toList(),
    );
  }
}
