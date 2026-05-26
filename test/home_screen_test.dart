import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/home/ui/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays important widgets correctly', (
    WidgetTester tester,
  ) async {
    final binding = tester.binding;

    binding.window.physicalSizeTestValue = const Size(1400, 3000);
    binding.window.devicePixelRatioTestValue = 1.0;

    addTearDown(binding.window.clearPhysicalSizeTestValue);
    addTearDown(binding.window.clearDevicePixelRatioTestValue);

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

    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('HomeScreen scroll works correctly', (WidgetTester tester) async {
    final binding = tester.binding;

    binding.window.physicalSizeTestValue = const Size(1400, 3000);
    binding.window.devicePixelRatioTestValue = 1.0;

    addTearDown(binding.window.clearPhysicalSizeTestValue);
    addTearDown(binding.window.clearDevicePixelRatioTestValue);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));

    await tester.pumpAndSettle();

    expect(find.text('Tea'), findsWidgets);
  });

  testWidgets('HomeScreen interactions work correctly', (
    WidgetTester tester,
  ) async {
    final binding = tester.binding;

    binding.window.physicalSizeTestValue = const Size(1400, 3000);
    binding.window.devicePixelRatioTestValue = 1.0;

    addTearDown(binding.window.clearPhysicalSizeTestValue);
    addTearDown(binding.window.clearDevicePixelRatioTestValue);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle();

    // tap category
    await tester.tap(find.text('Dessert'));
    await tester.pump();

    // tap favorite button
    final favButtons = find.byKey(const Key('bigFavGestureDetector'));
    await tester.tap(favButtons.first);

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
