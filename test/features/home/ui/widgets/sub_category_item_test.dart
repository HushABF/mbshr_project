import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';
import 'package:mbshr_project/features/home/ui/widgets/sub_category_item.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('SubCategoryItem Widget Test', () {
    Widget buildTestableWidget({
      required bool selected,
      required VoidCallback onTap,
    }) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: SubCategoryItem(
              label: 'Technology',
              imageAsset: 'assets/images/tea.png',
              selected: selected,
              onTap: onTap,
            ),
          ),
        ),
      );
    }

    testWidgets('renders label and image correctly', (
      WidgetTester tester,
    ) async {
      Helper.useDesignSize(tester);

      await tester.pumpWidget(
        buildTestableWidget(selected: false, onTap: () {}),
      );

      expect(find.text('Technology'), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (WidgetTester tester) async {
      Helper.useDesignSize(tester);

      bool tapped = false;

      await tester.pumpWidget(
        buildTestableWidget(
          selected: false,
          onTap: () {
            tapped = true;
          },
        ),
      );

      await tester.tap(find.text('Technology'));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('shows selected styles correctly', (WidgetTester tester) async {
      Helper.useDesignSize(tester);

      await tester.pumpWidget(
        buildTestableWidget(selected: true, onTap: () {}),
      );

      final container = tester.widget<Container>(find.byType(Container).last);

      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, ColorsManager.blueGray);

      final textWidget = tester.widget<Text>(find.text('Technology'));

      expect(textWidget.style, TextStyles.font14DarkCyanMedium);
    });

    testWidgets('shows unselected styles correctly', (
      WidgetTester tester,
    ) async {
      Helper.useDesignSize(tester);
      await tester.pumpWidget(
        buildTestableWidget(selected: false, onTap: () {}),
      );

      final container = tester.widget<Container>(find.byType(Container).last);

      final decoration = container.decoration as BoxDecoration;

      expect(decoration.color, null);

      final textWidget = tester.widget<Text>(find.text('Technology'));

      expect(textWidget.style, TextStyles.font14GreyRegular);
    });
  });
}
