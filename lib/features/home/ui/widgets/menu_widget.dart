import 'package:flutter/material.dart';
import 'package:mbshr_project/features/home/data/menu_item.dart';
import 'package:mbshr_project/features/home/ui/widgets/items_list.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<MenuItem> _items = const [
    MenuItem(
      name: 'Tea',
      description: 'Warm cup of hot chocolate with whipped cream',
      imagePath: 'assets/images/food.png',
      calories: 300,
      likes: 20,
      price: 35,
      isFavorite: true,
    ),
    MenuItem(
      name: 'Hot Chocolate',
      description: 'Warm cup of hot chocolate with whipped cream',
      imagePath: 'assets/images/tea.png',
      calories: 450,
      likes: 20,
      price: 40,
      isFavorite: true,
    ),
    MenuItem(
      name: 'Cappuccino',
      description: 'Rich espresso with steamed milk foam on top',
      imagePath: 'assets/images/steak.png',
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
    return ItemsList(items: _items, onFavoriteToggle: _toggleFavorite);
  }
}
