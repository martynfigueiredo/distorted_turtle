import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';
import 'carousel_widget.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Distorted Turtle',
          style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, 
          fontFamily: 'Roboto',
          fontSize: 12.0,),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
        centerTitle: true,
        actions: [
          Tooltip(
            message: 'Page 2',
            child: IconButton(
              icon: Icon(Icons.adb_rounded, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
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
              icon: Icon(Icons.adb_rounded, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page3()),
                );
              },
            ),
          ),
          Tooltip(
  message: 'Switch Theme',
  child: IconButton(
            icon: Icon(themeNotifier.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
),
          Tooltip(
            message: 'Help',
            child: IconButton(
              icon: Icon(Icons.help_outline, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
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
                            fontSize: 12),
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
                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                fontFamily: 'Roboto',
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
