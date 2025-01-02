import 'package:flutter/material.dart'; // For Material widgets and BoxFit
import 'package:carousel_slider/carousel_slider.dart'; // For CarouselSlider


class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls;
  final BoxFit boxFit;

  const CarouselWidget({super.key, required this.imageUrls, this.boxFit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.7,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
              child: Image.asset(
                url, // Use Image.asset for local images
                fit: boxFit,
                width: double.infinity,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
