import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/home/ui/widgets/featured_category_card.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  testWidgets('FeaturedCategoryCard displays title and description correctly', (
    WidgetTester tester,
  ) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(textScaler: TextScaler.linear(0.8)),
            child: const Scaffold(
              body: FeaturedCategoryCard(
                title: 'Coffee',
                description: 'Hot coffee with milk',
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Coffee'), findsOneWidget);

    expect(find.text('Hot coffee with milk'), findsOneWidget);
  });
}
