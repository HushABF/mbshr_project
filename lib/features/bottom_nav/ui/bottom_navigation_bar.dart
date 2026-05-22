import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/colors.dart';
import 'package:mbshr_project/core/theming/styles.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text("home")), // Home
    Center(child: Text("waiter")), // Chat
    Center(child: Text("pay")), // Calendar
    Center(child: Text("survey")), // Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Mbshr App")),
      floatingActionButton: SizedBox(
        height: 120.h,
        width: 100.w,
        child: Column(
           mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorsManager.mainPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              child: SvgPicture.asset(
                "assets/svgs/menu_icon.svg",
                height: 35.h,
                width: 35.w,
                colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            verticalSpace(20),
            Text(
              "Menu",
              style: TextStyles.font12WhiteRegular.copyWith(
                color: Colors.white,
                fontSize: 14.sp
              ),
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
         padding: EdgeInsets.zero,
        color: ColorsManager.mainPurple,
        elevation: 10,
        child: Container(
          height: 70.h,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // --- Left Side Icons ---
              Row(
                children: [
                  _buildNavItem(
                    iconPath: 'assets/svgs/home_icon.svg',
                    label: "Home",
                    index: 0,
                    isActive: _selectedIndex == 0,
                  ),
                  horizontalSpace(25),
                  _buildNavItem(
                    iconPath: 'assets/svgs/waiter_icon.svg',
                    label: "Waiter",
                    index: 1,
                    isActive: _selectedIndex == 1,
                  ),
                ],
              ),
              // --- Right Side Icons ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(
                    iconPath: 'assets/svgs/pay_icon.svg',
                    label: "Pay",
                    index: 2,
                    isActive: _selectedIndex == 2,
                  ),
                  horizontalSpace(25),
                  _buildNavItem(
                    iconPath: 'assets/svgs/survey_icon.svg',
                    label: "Survey",
                    index: 3,
                    isActive: _selectedIndex == 3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
       body: _pages[_selectedIndex],
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 22,
              width: 22,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            verticalSpace(6),
            Text(
              label,
              style: TextStyles.font12WhiteRegular.copyWith(
                color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
