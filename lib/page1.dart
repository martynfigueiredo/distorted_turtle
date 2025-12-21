import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'changelog_page.dart';
import 'about_page.dart';
import 'app_footer.dart';
import 'package:url_launcher/url_launcher.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late int _turtleIndex;

  @override
  void initState() {
    super.initState();
    _turtleIndex = Random().nextInt(20) + 1;
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Distorted Turtle',
          style: TextStyle(color: isDark ? Colors.white : Colors.black, 
          fontFamily: 'Roboto',
          fontSize: 14.0,),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.network(
              'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
              width: 18,
              height: 18,
              color: isDark ? Colors.white : Colors.black,
              colorBlendMode: BlendMode.srcIn,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.code),
            ),
            onPressed: () => _launchUrl('https://github.com/martynfigueiredo/distorted_turtle'),
            tooltip: 'GitHub Repository',
          ),
          PopupMenuButton<ThemeMode>(
            icon: Icon(
              themeNotifier.themeMode == ThemeMode.system
                  ? Icons.settings
                  : (themeNotifier.themeMode == ThemeMode.light 
                      ? Icons.light_mode 
                      : Icons.dark_mode),
              size: 18.0,
            ),
            tooltip: 'Switch Theme',
            onSelected: (ThemeMode mode) {
              themeNotifier.setThemeMode(mode);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<ThemeMode>>[
              const PopupMenuItem<ThemeMode>(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 18),
                    SizedBox(width: 8),
                    Text('System'),
                  ],
                ),
              ),
              const PopupMenuItem<ThemeMode>(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    Icon(Icons.light_mode, size: 18),
                    SizedBox(width: 8),
                    Text('Light'),
                  ],
                ),
              ),
              const PopupMenuItem<ThemeMode>(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    Icon(Icons.dark_mode, size: 18),
                    SizedBox(width: 8),
                    Text('Dark'),
                  ],
                ),
              ),
            ],
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
                  builder: (context) => AlertDialog(
                    title: const Text('Help'),
                    content: const Text('This is a simple Material 3 app. \n\nClick on the theme icon to switch between light, dark, and system themes. \n\nCheck the Changelog for version history.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'images/turtle_$_turtleIndex.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          AppFooter(),
        ],
      ),
    );
  }
}
