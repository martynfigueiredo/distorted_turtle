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
        title: Text(
          'Distorted Turtle',
          style: TextStyle(color: Colors.purple, fontFamily: 'Roboto'),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.purple),
        centerTitle: true,
        actions: [
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
            message: 'Page 3',
            child: IconButton(
              icon: Icon(Icons.adb_rounded, color: Colors.purple),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
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
              width: MediaQuery.of(context).size.width * 0.8,
              child: CarouselWidget(
                imageUrls: [
                  'images/1.png',
                  'images/2.png',
                  'images/3.png',
                  'images/4.png',
                  'images/5.png',
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
