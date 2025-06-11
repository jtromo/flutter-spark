// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_spark/bloc/counter/counter_cubit.dart';
import 'package:flutter_spark/bloc/theme/theme_cubit.dart';
import 'package:flutter_spark/pages/counter_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(setupTestWidget(const CounterPage(), counterCubit: CounterCubit(), themeCubit: ThemeCubit()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('1'), findsNothing);
    expect(find.text('0'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('-1'), findsOneWidget);

    // Tap the 'reset' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verify that our counter has reset.
    expect(find.text('-1'), findsNothing);
    expect(find.text('1'), findsNothing);
    expect(find.text('-1'), findsNothing);
    expect(find.text('0'), findsOneWidget);
  });
}
