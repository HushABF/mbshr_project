import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/features/home/ui/widgets/home_app_bar.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  testWidgets('HomeAppBar displays title, branch and language', (
    WidgetTester tester,
  ) async {
    Helper.useDesignSize(tester);

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(home: Scaffold(appBar: const HomeAppBar())),
      ),
    );

    expect(find.text('Mbshr'), findsOneWidget);

    expect(find.text('Riyadh Branch'), findsOneWidget);

    expect(find.text('EN'), findsOneWidget);

    expect(find.byType(IconButton), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);
  });
}
