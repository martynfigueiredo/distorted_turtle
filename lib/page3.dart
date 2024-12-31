import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'carousel_widget.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distorted Turtle',
        style: TextStyle(color: Colors.lightGreenAccent, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.do_disturb_on_rounded, color: Colors.lightGreenAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.tram_outlined, color: Colors.lightGreenAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'images/7.png',
              'images/8.png',
              'images/9.png',
  ],
  boxFit: BoxFit.fill,
),
Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'distortedturtle.dev since 2024',
              style: TextStyle(
                color: Colors.lightGreenAccent,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
