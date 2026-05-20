import 'package:flutter/material.dart';
import 'package:mbshr_project/features/menu/data/models/menu_item.dart';
import 'package:mbshr_project/features/menu/ui/widgets/items_list.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<MenuItem> _items = const [
    MenuItem(
      name: 'Tea',
      description: 'Warm cup of hot chocolate with whipped cream',
      imagePath: 'mbshr_project/assets/images/food.png',
      calories: 300,
      likes: 20,
      price: 35,
      isFavorite: true,
    ),
    MenuItem(
      name: 'Hot Chocolate',
      description: 'Warm cup of hot chocolate with whipped cream',
      imagePath: 'mbshr_project/assets/images/food.png',
      calories: 450,
      likes: 20,
      price: 40,
      isFavorite: true,
    ),
    MenuItem(
      name: 'Cappuccino',
      description: 'Rich espresso with steamed milk foam on top',
      imagePath: 'mbshr_project/assets/images/food.png',
      calories: 120,
      likes: 35,
      price: 25,
      isFavorite: false,
    ),
  ];

  void _toggleFavorite(int index) {
    setState(() {
      final item = _items[index];
      _items = List.of(_items)
        ..[index] = MenuItem(
          name: item.name,
          description: item.description,
          imagePath: item.imagePath,
          calories: item.calories,
          likes: item.likes,
          price: item.price,
          isFavorite: !item.isFavorite,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: ItemsList(items: _items, onFavoriteToggle: _toggleFavorite),
        ),
      ),
    );
  }
}
