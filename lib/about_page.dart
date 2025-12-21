import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _AboutSection(
                  title: 'Distorted Turtle',
                  content: 'Distorted Turtle is a creative project born in 2024 as a minimalist exploration of Flutter\'s capabilities. '
                      'It began as a study of Material 3 design principles, focusing on clean aesthetics, dynamic themes, and a seamless user experience. '
                      '\n\nThe project evolved into a gallery of generative AI art, showcasing the intersection of high-tech cyberpunk themes with high-quality digital textures. '
                      'Each turtle image is a unique fusion of robotic complexity and smooth, premium gradients, designed to look stunning on every screen.',
                ),
                _AboutSection(
                  title: 'Future Vision',
                  content: 'Currently, Distorted Turtle uses a curated set of pre-generated art to ensure high visual quality. \n\nLooking ahead, I intend to integrate real-time generative capabilities, allowing users to generate their own unique turtle variants directly within the app using cutting-edge AI models.',
                ),
                _AboutSection(
                  title: 'Source Code',
                  content: 'This project is open source. You can explore the implementation, contribute, or report issues on our GitHub repository.',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: TextButton.icon(
                    onPressed: () => _launchUrl('https://github.com/martynfigueiredo/distorted_turtle'),
                    icon: const Icon(Icons.code),
                    label: const Text('Visit GitHub Repository'),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Image Prompts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Copy these prompts to use in tools like Midjourney or DALL-E 3:',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                _PromptCard(
                  title: 'Prompt 1: Balanced Original',
                  prompt: 'A sleek, distorted cybernetic turtle featuring holographic shells and neon-lit circuitry, blending high-tech cyberpunk aesthetics with the clean, rounded shapes and tonal color palettes of Material 3. The art style combines glitch-tech textures with smooth, premium digital gradients and soft shadows. High resolution, minimalist tech-art background.',
                ),
                _PromptCard(
                  title: 'Prompt 2: Dark Glassmorphism',
                  prompt: 'A cybernetic turtle with a shell made of translucent glassmorphism layers and intricate neon-purple circuit lighting. Floating Material 3 UI elements and soft-glow effects around the turtle. Cinematic lighting, ultra-dark minimalist background, 8k resolution, tech-noir aesthetic.',
                ),
                _PromptCard(
                  title: 'Prompt 3: Pristine Tech',
                  prompt: 'High-end product photography of a robotic turtle, premium white ceramic body with gold-plated circuitry and a sky-blue holographic shell. Clean Material 3 design language with soft studio lighting and an ultra-minimalist white-to-grey gradient background. Sleek and futuristic.',
                ),
                _PromptCard(
                  title: 'Prompt 4: Deep Glitch Art',
                  prompt: 'Abstract digital art of a cyber-turtle with heavy glitch distortion effects. Fragmented holographic shell shards, vibrant Material 3 color palette (vibrant pink, electric blue, and violet). High-tech aesthetic, sharp focus on mechanical details, digital masterpiece.',
                ),
              ]),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  final String title;
  final String content;

  const _AboutSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                    fontSize: 15,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PromptCard extends StatelessWidget {
  final String title;
  final String prompt;

  const _PromptCard({required this.title, required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.copy, size: 16),
          tooltip: 'Copy Prompt',
          onPressed: () {
            Clipboard.setData(ClipboardData(text: prompt));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Prompt copied!')),
            );
          },
        ),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          SelectableText(
            prompt,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  fontSize: 11,
                  height: 1.4,
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}
