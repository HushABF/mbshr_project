import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorsManager.mainPurple,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/svgs/three_lines_menu.svg',
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      title: Column(
        crossAxisAlignment: .center,
        children: [
          Text('Mbshr', style: TextStyles.font20WhiteSemiBold),
          Text('Riyadh Branch', style: TextStyles.font12WhiteRegular),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(
            left: 4.r,
            right: 12.r,
            bottom: 4.r,
            top: 4.r,
          ),
          margin: EdgeInsets.only(right: 16.r),
          decoration: BoxDecoration(
            color: ColorsManager.lightPurple,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/united-states.png',
                  // fit: .cover,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              horizontalSpace(6),
              Text('EN', style: TextStyles.font12WhiteRegular),
            ],
          ),
        ),
      ],
    );
  }
}
