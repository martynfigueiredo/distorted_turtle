import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imageUrls;

  CarouselWidget({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500.0, // Adjust the height as needed
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 9 / 16, // 16:9 vertical -> 9/16 (height: width)
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        viewportFraction: 1.0, // Use 1.0 to fill the width of the screen
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 114, 146, 239),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000.0, // Adjust width to fill container
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
