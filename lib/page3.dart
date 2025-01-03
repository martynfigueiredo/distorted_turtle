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
        title: Text(
          'Distorted Turtle',
          style: TextStyle(color: Colors.purple, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.purple),
        centerTitle: true,
        actions: [
          Tooltip(
  message: 'Page 1',
  child: IconButton(
    icon: Icon(Icons.adb_rounded, color: Colors.purple),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page1()),
      );
    },
  ),
),
          Tooltip(
  message: 'Page 2',
  child: IconButton(
    icon: Icon(Icons.adb_rounded, color: Colors.purple),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Page2()),
      );
    },
  ),
),
Tooltip(
  message: 'Help',
         child: IconButton(
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
                        'This is just a simple 101 Flutter Project.\n'
                        'Built by Martyn (https://martynfigueiredo.dev) & Alvin (https://alvinpereira.dev).\n'
                        'Here\'s the code on Github. (https://github.com/martynfigueiredo/distorted_turtle)\n'
                        'Enjoy! :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              );
            },
          ),
),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust the width as needed
              child: CarouselWidget(
                imageUrls: [
                  'images/11.png',
                  'images/12.png',
                  'images/13.png',
                  'images/14.png',
                  'images/15.png',
                ],
                boxFit: BoxFit.fill,
              ),
            ),
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
