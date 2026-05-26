import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/home/ui/widgets/category_chip.dart';

void main() {
  testWidgets('CategoryChip displays label correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: CategoryChip(label: 'Burger', selected: false, onTap: () {}),
          ),
        ),
      ),
    );

    expect(find.text('Burger'), findsOneWidget);
  });

  testWidgets('CategoryChip triggers onTap callback', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: CategoryChip(
              label: 'Pizza',
              selected: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));

    expect(tapped, true);
  });

  testWidgets('CategoryChip shows selected style', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: CategoryChip(label: 'Selected', selected: true, onTap: () {}),
          ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('Selected'));

    expect(textWidget.style, isNotNull);
  });
}
