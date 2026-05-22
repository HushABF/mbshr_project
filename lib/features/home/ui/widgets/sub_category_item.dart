import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
    required this.label,
    required this.imageAsset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String imageAsset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: SizedBox(
              width: 88.w,
              height: 88.h,
              child: Image.asset(imageAsset),
            ),
          ),
          verticalSpace(5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
            constraints: BoxConstraints(minWidth: 70.w),
            decoration: BoxDecoration(
              color: selected ? ColorsManager.blueGray : null,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                label,
                style: selected
                    ? TextStyles.font14DarkCyanMedium
                    : TextStyles.font14GreyRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
