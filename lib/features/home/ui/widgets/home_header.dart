import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.r,
        bottom: 10.r,
        right: 12.r,
        left: 24.r,
      ),
      child: Image.asset('assets/images/main-food-ad.png'),
    );
  }
}
