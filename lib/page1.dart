import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';
import 'carousel_widget.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

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
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.tram_outlined, color: Colors.lightGreenAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'images/1.png',
              'images/2.png',
              'images/3.png',
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
