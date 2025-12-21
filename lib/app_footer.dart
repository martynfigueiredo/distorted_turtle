import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        children: [
          const Divider(height: 1),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.network(
                  'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
                  width: 24,
                  height: 24,
                  color: isDark ? Colors.white : Colors.black,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.code),
                ),
                onPressed: () => _launchUrl('https://github.com/martynfigueiredo/distorted_turtle'),
                tooltip: 'GitHub Repository',
              ),
            ],
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
}
