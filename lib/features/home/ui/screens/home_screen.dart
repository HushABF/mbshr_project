import 'package:flutter/material.dart';
import 'package:mbshr_project/features/home/ui/widgets/categories_section.dart';
import 'package:mbshr_project/features/home/ui/widgets/home_app_bar.dart';
import 'package:mbshr_project/features/home/ui/widgets/home_header.dart';
import 'package:mbshr_project/features/home/ui/widgets/menu_section_header.dart';
import 'package:mbshr_project/features/home/ui/widgets/menu_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final selectedCategory =
        CategoriesSection.categories[_selectedCategoryIndex];

    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeHeader()),
          SliverToBoxAdapter(
            child: CategoriesSection(
              selectedIndex: _selectedCategoryIndex,
              onCategoryChanged: (index) =>
                  setState(() => _selectedCategoryIndex = index),
            ),
          ),
          SliverToBoxAdapter(
            child: MenuSectionHeader(
              title: selectedCategory.name,
              description:
                  'Category description goes here Category description goes here '
                  'Category description goes here Category description goes here',
            ),
          ),
          const SliverSafeArea(top: false, sliver: MenuWidget()),
        ],
      ),
    );
  }
}
