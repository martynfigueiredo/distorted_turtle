import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => _launchUrl('https://github.com/martynfigueiredo/distorted_turtle'),
            icon: Icon(
              Icons.code,
              size: 14,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
            label: Text(
              'View on GitHub',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.0,
                color: isDark ? Colors.white70 : Colors.black54,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'distortedturtle.dev since 2024',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
