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
        title: Text('Page 3'),
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'https://via.placeholder.com/400x200',
              'https://via.placeholder.com/400x200',
              'https://via.placeholder.com/400x200',
            ],
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
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
            child: Text('Go to Page 2'),
          ),
        ],
      ),
    );
  }
}
