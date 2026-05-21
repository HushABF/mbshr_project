import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';
import 'package:mbshr_project/features/home/data/category.dart';
import 'package:mbshr_project/features/home/ui/widgets/category_item.dart';

class CategoriesSection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onCategoryChanged;

  static const List<Category> categories = [
    Category(name: 'Salads', imagePath: 'assets/images/salad.png'),
    Category(name: 'Breakfast', imagePath: 'assets/images/breack_fast.png'),
    Category(name: 'Dessert', imagePath: 'assets/images/desert.png'),
    Category(name: 'Saudi Day', imagePath: 'assets/images/saudi_day.png'),
    Category(name: 'Offers', imagePath: 'assets/images/offers.png'),
  ];

  const CategoriesSection({
    super.key,
    required this.selectedIndex,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: TextStyles.font20DarkGreySemiBold),
          verticalSpace(14),
          const _FilterTabsRow(),
          verticalSpace(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index < categories.length - 1 ? 18.w : 0,
                  ),
                  child: CategoryItem(
                    category: categories[index],
                    isSelected: selectedIndex == index,
                    onTap: () => onCategoryChanged(index),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTabsRow extends StatefulWidget {
  const _FilterTabsRow();

  @override
  State<_FilterTabsRow> createState() => _FilterTabsRowState();
}

class _FilterTabsRowState extends State<_FilterTabsRow> {
  int _selectedIndex = 0;

  static const List<String> _tabs = [
    'Food',
    'Our special Drinks',
    'Hot Drinks',
    'Saudi',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_tabs.length, (index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Padding(
              padding: EdgeInsets.only(
                right: index < _tabs.length - 1 ? 10.w : 0,
              ),
              child: _FilterTab(label: _tabs[index], isSelected: isSelected),
            ),
          );
        }),
      ),
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _FilterTab({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        border: Border.all(
          color: isSelected ? ColorsManager.darkCyan : ColorsManager.lightPurple,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: isSelected
            ? TextStyles.font14DarkCyanMedium
            : TextStyles.font14GreyRegular,
      ),
    );
  }
}
