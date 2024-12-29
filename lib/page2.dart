import 'package:flutter/material.dart';
import 'page1.dart';
import 'page3.dart';
import 'carousel_widget.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'assets/images/4.png',
              'assets/images/5.png',
              'assets/images/6.png',
  ],
  boxFit: BoxFit.fill,
),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
            child: Text('Go to Page 1'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3()),
              );
            },
            child: Text('Go to Page 3'),
          ),
        ],
      ),
    );
  }
}
