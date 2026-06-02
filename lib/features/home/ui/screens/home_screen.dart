import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbshr_project/core/helpers/spacing.dart';
import 'package:mbshr_project/core/theming/styles.dart';
import 'package:mbshr_project/features/home/data/category.dart';
import 'package:mbshr_project/features/home/ui/widgets/category_chip.dart';
import 'package:mbshr_project/features/home/ui/widgets/featured_category_card.dart';
import 'package:mbshr_project/features/home/ui/widgets/food_card.dart';
import 'package:mbshr_project/features/home/ui/widgets/home_app_bar.dart';
import 'package:mbshr_project/features/home/ui/widgets/home_header.dart';
import 'package:mbshr_project/features/home/ui/widgets/sub_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<String> kHomeCategories = [
    'Food',
    'Our speacial Drinks',
    'Dessert',
    'Saudi Day',
  ];

  static List<Category> kHomeSubCategories = [
    Category(name: 'Salads', imagePath: 'assets/images/salads.png'),
    Category(name: 'Breakfast', imagePath: 'assets/images/breakfast.png'),
    Category(name: 'Dessert', imagePath: 'assets/images/dessert.png'),
    Category(name: 'Saudi Day', imagePath: 'assets/images/saudi-day.png'),
    Category(name: 'Burgers', imagePath: 'assets/images/burgers.png'),
    Category(name: 'Sides', imagePath: 'assets/images/sides.png'),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _foodItemCount = 4;

  int _selectedCategoryIndex = 0;
  int _selectedSubCategoryIndex = 0;
  final List<bool> _bigFavorites = List<bool>.filled(_foodItemCount, false);
  final List<bool> _smallFavorites = List<bool>.filled(_foodItemCount, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeHeader()),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 32.r),
              child: Text(
                'Categories',
                style: TextStyles.font20DarkGreySemiBold,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _PinnedListDelegate(
              height: 55.h,
              child: Padding(
                padding: EdgeInsets.only(left: 32.r),
                child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemCount: HomeScreen.kHomeCategories.length,
                  itemBuilder: (context, index) {
                    return CategoryChip(
                      label: HomeScreen.kHomeCategories[index],
                      selected: index == _selectedCategoryIndex,
                      onTap: () => setState(() {
                        _selectedCategoryIndex = index;
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _PinnedListDelegate(
              height: 130.h,
              topPadding: 12.h,
              child: Padding(
                padding: EdgeInsets.only(left: 24.r),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: HomeScreen.kHomeSubCategories.length,
                  scrollDirection: .horizontal,
                  itemBuilder: (context, index) {
                    final item = HomeScreen.kHomeSubCategories[index];
                    return SubCategoryItem(
                      key: Key('sub_category_$index'),
                      label: item.name,
                      imageAsset: item.imagePath,
                      selected: index == _selectedSubCategoryIndex,
                      onTap: () => setState(() {
                        _selectedSubCategoryIndex = index;
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(10)),
          const SliverToBoxAdapter(
            child: FeaturedCategoryCard(
              title: 'Tea',
              description:
                  'Category description goes here Category description goes here Category description goes here Category description goes here',
            ),
          ),
          SliverToBoxAdapter(child: verticalSpace(12)),

          SliverList.builder(
            itemCount: _foodItemCount,
            itemBuilder: (context, index) {
              return FoodCard(
                key: Key('food_card_$index'),
                bigFav: _bigFavorites[index],
                smallFav: _smallFavorites[index],
                onToggleBig: () => setState(() {
                  _bigFavorites[index] = !_bigFavorites[index];
                }),
                onToggleSmall: () => setState(() {
                  _smallFavorites[index] = !_smallFavorites[index];
                }),
              );
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(144)),
        ],
      ),
    );
  }
}

class _PinnedListDelegate extends SliverPersistentHeaderDelegate {
  _PinnedListDelegate({
    required this.child,
    required this.height,
    this.topPadding = 0,
  });

  final Widget child;
  final double height;
  final double topPadding;

  double get _total => height + topPadding;

  @override
  double get minExtent => _total;
  @override
  double get maxExtent => _total;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      height: _total,
      padding: EdgeInsets.only(top: topPadding),
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _PinnedListDelegate oldDelegate) =>
      oldDelegate.child != child ||
      oldDelegate.height != height ||
      oldDelegate.topPadding != topPadding;
}
