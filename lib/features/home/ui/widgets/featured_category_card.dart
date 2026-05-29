import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class FeaturedCategoryCard extends StatelessWidget {
  const FeaturedCategoryCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 100.h),
      padding: EdgeInsets.all(8.r),
      margin: EdgeInsets.only(left: 22.r, right: 10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyles.font20DarkGreySemiBold),
          verticalSpace(4),
          Padding(
            padding: EdgeInsets.only(left: 12.r),
            child: Text(
              description,
              style: TextStyles.font12GreyRegular,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
