import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.mainPurple,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white, size: 24.sp),
        onPressed: () {},
      ),
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Mbshr', style: TextStyles.font20WhiteSemiBold),
          Text('Riyadh Branch', style: TextStyles.font12WhiteRegular),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: const _LanguageButton(),
        ),
      ],
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🇬🇧', style: TextStyle(fontSize: 14.sp)),
          SizedBox(width: 4.w),
          Text('EN', style: TextStyles.font12WhiteRegular),
        ],
      ),
    );
  }
}
