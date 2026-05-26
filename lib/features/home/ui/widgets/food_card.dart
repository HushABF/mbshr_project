import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.bigFav,
    required this.smallFav,
    required this.onToggleBig,
    required this.onToggleSmall,
  });

  final bool bigFav;
  final bool smallFav;
  final VoidCallback onToggleBig;
  final VoidCallback onToggleSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22.r, right: 10.r, bottom: 16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: SizedBox(
                  width: 150.r,
                  height: 150.r,
                  child: Image.asset(
                    key: const Key('teaImage'),

                    'assets/images/tea.png',
                  ),
                ),
              ),
              Positioned(
                top: 6.r,
                right: 0.r,
                child: GestureDetector(
                  key: const Key('bigFavGestureDetector'),
                  onTap: onToggleBig,
                  child: Container(
                    width: 32.w,
                    height: 32.h,
                    padding: EdgeInsets.all(4.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      bigFav ? Icons.favorite : Icons.favorite_border,
                      color: bigFav ? ColorsManager.pink : Colors.grey,
                      size: 24.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
          horizontalSpace(20),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 8.r, bottom: 4.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tea', style: TextStyles.font14DarkGreySemiBold),
                  SizedBox(height: 4.h),
                  Text(
                    'Warm cup of hot chocolate with whipped cream',
                    style: TextStyles.font12GreyRegular,
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4.w,
                    runSpacing: 4.h,
                    children: [
                      SvgPicture.asset('assets/svgs/kcal.svg'),
                    //  horizontalSpace(4),
                      Text('300 Kcal', style: TextStyles.font12GreyRegular),
                     // horizontalSpace(4),
                      GestureDetector(
                        key: const Key('smallFavGestureDetector'),
                        onTap: onToggleSmall,
                        child: Icon(
                          smallFav ? Icons.favorite : Icons.favorite_border,
                          color: smallFav ? ColorsManager.pink : Colors.grey,
                          size: 24.r,
                        ),
                      ),
                     // horizontalSpace(4),
                      Text('20 likes', style: TextStyles.font12GreyRegular),
                    ],
                  ),
                  verticalSpace(6),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '35 ',
                          style: TextStyles.font14DarkCyanSemiBold,
                        ),
                        TextSpan(
                          text: 'SAR',
                          style: TextStyles.font12DarkCyanMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
