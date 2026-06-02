import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/home/ui/widgets/food_card.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  testWidgets('FoodCard displays data correctly', (WidgetTester tester) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: FoodCard(
              bigFav: true,
              smallFav: true,
              onToggleBig: () {},
              onToggleSmall: () {},
            ),
          ),
        ),
      ),
    );

    Finder teaImageFinder = find.byKey(const Key('teaImage'));
    expect(teaImageFinder, findsOneWidget);
    // find.descendant(
    //   of: teaImageFinder,
    //   matching: find.text('assets/images/tea.png'),
    // );

    expect(find.text('Tea'), findsOneWidget);

    expect(
      find.text('Warm cup of hot chocolate with whipped cream'),
      findsOneWidget,
    );

    expect(find.byKey(const Key('bigFavGestureDetector')), findsOneWidget);
    expect(find.byKey(const Key('smallFavGestureDetector')), findsOneWidget);
  });

  testWidgets('FoodCard runs GestureDetectors correctly', (
    WidgetTester tester,
  ) async {
    Helper.useDesignSize(tester);

    bool bigTapped = false;
    bool smallTapped = false;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: FoodCard(
              bigFav: false,
              smallFav: false,
              onToggleBig: () {
                bigTapped = true;
              },
              onToggleSmall: () {
                smallTapped = true;
              },
            ),
          ),
        ),
      ),
    );
    // expect(find.byIcon(Icons.favorite_border), findsWidgets);
    await tester.tap(find.byKey(const Key('bigFavGestureDetector')));
    await tester.tap(find.byKey(const Key('smallFavGestureDetector')));

    await tester.pump();

    expect(bigTapped, true);
    expect(smallTapped, true);

    // expect(find.byIcon(Icons.favorite), findsWidgets);
  });

  testWidgets('FoodCard shows favorite icons correctly', (
    WidgetTester tester,
  ) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: FoodCard(
              bigFav: true,
              smallFav: true,
              onToggleBig: () {},
              onToggleSmall: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.favorite), findsNWidgets(2));

    //  expect(find.byIcon(Icons.favorite), findsNWidgets(2));
  });
}
