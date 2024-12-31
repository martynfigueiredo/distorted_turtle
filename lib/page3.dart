import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'carousel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distorted Turtle',
        style: TextStyle(color: Colors.purple, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.purple),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.adb_rounded, color: Colors.purple),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.rice_bowl_rounded, color: Colors.purple),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page2()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.purple),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'This is just a simple 101 Flutter Project.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.code, color: Colors.purple),
            onPressed: () {
              launch('https://github.com/martynfigueiredo/distorted_turtle');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselWidget(
            imageUrls: [
              'images/11.png',
              'images/12.png',
              'images/13.png',
              'images/14.png',
              'images/15.png',
  ],
  boxFit: BoxFit.fill,
),
Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'distortedturtle.dev since 2024',
              style: TextStyle(
                color: Colors.purple,
                fontFamily: 'Roboto',
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
