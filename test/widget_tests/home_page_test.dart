// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_spark/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home page smoke test', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.text('Welcome to Flutter Spark!'), findsOneWidget);

    // Tap the drawer and trigger a frame.
    Finder drawerButton = find.byType(DrawerButton);
    expect(drawerButton, findsOneWidget);
    await tester.tap(drawerButton);
    await tester.pump();

    Finder drawer = find.byType(Drawer);
    expect(drawer, findsOneWidget);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Counter'), findsOneWidget);
    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Image Picker'), findsOneWidget);
    expect(find.text('Grid'), findsOneWidget);
    expect(find.text('Reactive'), findsOneWidget);
    expect(find.text('Exit'), findsOneWidget);
  });
}
