import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _AboutSection(
            title: 'Distorted Turtle',
            content: 'Distorted Turtle is a project born in 2024 as a minimalist Flutter exploration. '
                'It focuses on clean aesthetics, Material 3 design, and the intersection of '
                'generative AI art with fluid mobile/web interfaces.',
          ),
          const SizedBox(height: 16),
          const Text(
            'Image Prompts',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Use these prompts in tools like Midjourney or DALL-E 3 to generate more turtle variants:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
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
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
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
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  tooltip: 'Copy Prompt',
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: prompt));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Prompt copied to clipboard!')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            SelectableText(
              prompt,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    height: 1.4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
