import 'package:flutter/material.dart';
import 'page1.dart';
import 'carousel_widget.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Distorted Turtle',
          style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, 
          fontFamily: 'Roboto',
          fontSize: 14.0,),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,),
        centerTitle: true,
        actions: [
          Tooltip(
  message: 'Page 1',
  child: IconButton(
    icon: Text(
      '🐢',
      style: TextStyle(
        fontSize: 18.0,
        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      ),
    ),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Page1()),
      );
    },
  ),
),
Tooltip(
  message: 'Switch Theme',
  child: IconButton(
            icon: Icon(themeNotifier.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode, size: 18.0),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
),
Tooltip(
  message: 'Help',
         child: IconButton(
            icon: Icon(Icons.help_outline, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, size: 18.0),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black.withOpacity(0.8) : Colors.white.withOpacity(0.8),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'This is just a simple 101 Flutter Project.\n'
                        'Built by Martyn & Alvin.\n'
                        'Enjoy! :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontSize: 14),
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
          Spacer(),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust the width as needed
              child: CarouselWidget(
                imageUrls: [
                  'images/9.png',
                  'images/10.png',
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
                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                fontFamily: 'Roboto',
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
