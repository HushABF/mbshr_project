import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/features/home/ui/screens/home_screen.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  testWidgets('HomeScreen displays important widgets correctly', (
    WidgetTester tester,
  ) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Categories'), findsOneWidget);

    expect(find.text('Food'), findsOneWidget);

    expect(find.text('Dessert'), findsWidgets);

    expect(find.text('Salads'), findsOneWidget);

    expect(find.text('Breakfast'), findsOneWidget);

    expect(find.text('Tea'), findsWidgets);
  });

  testWidgets('HomeScreen scroll works correctly', (WidgetTester tester) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));

    await tester.pumpAndSettle();

    // 👇 هنا المهم
    expect(find.byKey(const Key('food_card_3')), findsOneWidget);
  });

  testWidgets('HomeScreen interactions work correctly', (tester) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    final iconBefore = tester.widget<Icon>(
      find.descendant(
        of: find.byKey(const Key('bigFavGestureDetector')).first,
        matching: find.byType(Icon),
      ),
    );

    expect(iconBefore.color, Colors.grey);

    await tester.tap(find.byKey(const Key('bigFavGestureDetector')).first);
    await tester.pump();

    final iconAfter = tester.widget<Icon>(
      find.descendant(
        of: find.byKey(const Key('bigFavGestureDetector')).first,
        matching: find.byType(Icon),
      ),
    );

    expect(iconAfter.color, ColorsManager.pink);
  });
}
