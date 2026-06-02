import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/bottom_nav/ui/bottom_navigation_bar.dart';
import 'package:mbshr_project/features/home/ui/screens/home_screen.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  Future<void> pumpBottomNav(WidgetTester tester) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: BottomNavigationBarScreen()),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('BottomNavigationBarScreen renders correctly', (
    WidgetTester tester,
  ) async {
    await pumpBottomNav(tester);

    expect(find.byType(BottomNavigationBarScreen), findsOneWidget);

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Waiter'), findsOneWidget);
    expect(find.text('Pay'), findsOneWidget);
    expect(find.text('Survey'), findsOneWidget);

    expect(find.text('Menu'), findsOneWidget);

    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('Home page is displayed by default', (WidgetTester tester) async {
    await pumpBottomNav(tester);

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Bottom navigation changes pages correctly', (
    WidgetTester tester,
  ) async {
    await pumpBottomNav(tester);

    // Waiter
    await tester.tap(find.text('Waiter'));
    await tester.pumpAndSettle();

    expect(find.text('waiter'), findsOneWidget);

    // Pay
    await tester.tap(find.text('Pay'));
    await tester.pumpAndSettle();

    expect(find.text('pay'), findsOneWidget);

    // Survey
    await tester.tap(find.text('Survey'));
    await tester.pumpAndSettle();

    expect(find.text('survey'), findsOneWidget);

    // Home
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('FloatingActionButton is tappable', (WidgetTester tester) async {
    await pumpBottomNav(tester);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.byType(BottomNavigationBarScreen), findsOneWidget);
  });
}
