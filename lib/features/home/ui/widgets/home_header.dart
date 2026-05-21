import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: SizedBox(
          height: 180.h,
          width: double.infinity,
          child: Image.asset(
            'assets/images/steak.png',
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                Container(height: 180.h, color: const Color(0xFFEEEEEE)),
          ),
        ),
      ),
    );
  }
}
