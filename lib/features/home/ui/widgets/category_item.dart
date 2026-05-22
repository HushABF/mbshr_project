import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';
import 'package:mbshr_project/features/home/data/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 68.w,
            height: 68.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: isSelected
                  ? Border.all(color: ColorsManager.darkCyan, width: 2)
                  : Border.all(color: Colors.transparent, width: 2),
              color: const Color(0xFFF5F5F5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const SizedBox(),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            category.name,
            style: isSelected
                ? TextStyles.font12DarkCyanMedium
                : TextStyles.font12GreyRegular,
          ),
          SizedBox(height: 4.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isSelected ? 24.w : 0,
            height: 3.h,
            decoration: BoxDecoration(
              color: ColorsManager.darkCyan,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ],
      ),
    );
  }
}
