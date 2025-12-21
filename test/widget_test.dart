// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:distorted_turtle/main.dart';

import 'package:provider/provider.dart';
import 'package:distorted_turtle/theme_notifier.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify that our app shows the title.
    expect(find.text('Distorted Turtle'), findsAtLeast(1));
    
    // Verify that it shows the footer text.
    expect(find.text('distortedturtle.dev since 2024'), findsOneWidget);
  });
}
