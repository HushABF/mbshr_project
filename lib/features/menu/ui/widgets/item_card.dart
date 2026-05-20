import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';
import 'package:mbshr_project/features/menu/data/models/menu_item.dart';

class ItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onFavoriteToggle;

  const ItemCard({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ItemImage(
            imagePath: item.imagePath,
            isFavorite: item.isFavorite,
            onFavoriteToggle: onFavoriteToggle,
          ),
          horizontalSpace(12),
          Expanded(child: _ItemDetails(item: item)),
        ],
      ),
    );
  }
}

class _ItemImage extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const _ItemImage({
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            imagePath,
            width: 90.w,
            height: 90.h,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 90.w,
              height: 90.h,
              color: ColorsManager.blueGray,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onFavoriteToggle,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: ColorsManager.pink,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemDetails extends StatelessWidget {
  final MenuItem item;

  const _ItemDetails({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name, style: TextStyles.font14DarkGreySemiBold),
        verticalSpace(4),
        Text(
          item.description,
          style: TextStyles.font12GreyRegular,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(6),
        _StatsRow(calories: item.calories, likes: item.likes),
        verticalSpace(4),
        Text(
          '${item.price.toStringAsFixed(0)} SAR',
          style: TextStyles.font14DarkCyanSemiBold,
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int calories;
  final int likes;

  const _StatsRow({required this.calories, required this.likes});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.water_drop, color: ColorsManager.darkCyan, size: 14.sp),
        horizontalSpace(3),
        Text('$calories Kcal', style: TextStyles.font12DarkCyanMedium),
        horizontalSpace(12),
        Icon(Icons.favorite, color: ColorsManager.pink, size: 14.sp),
        horizontalSpace(3),
        Text(
          '$likes likes',
          style: TextStyles.font12GreyRegular.copyWith(
            color: ColorsManager.pink,
          ),
        ),
      ],
    );
  }
}
