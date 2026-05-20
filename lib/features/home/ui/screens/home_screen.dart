import 'package:flutter/material.dart';
import 'package:mbshr_project/features/home/ui/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Add BottomNavigationBar
      body: CustomScrollView(
        slivers: [
          // TODO: SliverAppBar (search bar + profile avatar)
          // TODO: SliverToBoxAdapter — horizontal categories list
          SliverSafeArea(top: true, sliver: MenuWidget()),
        ],
      ),
    );
  }
}
