import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'changelog_page.dart';
import 'about_page.dart';

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
          fontSize: 14.0,),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
        centerTitle: true,
        actions: [
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
            message: 'Changelog',
            child: IconButton(
              icon: const Icon(Icons.history, size: 18.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangelogPage()),
                );
              },
            ),
          ),
          Tooltip(
            message: 'About',
            child: IconButton(
              icon: const Icon(Icons.info_outline, size: 18.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
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
                      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black.withValues(alpha: 0.8) : Colors.white.withValues(alpha: 0.8),
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
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(
                    'images/turtle_${Random().nextInt(20) + 1}.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
