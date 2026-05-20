import 'package:flutter/material.dart';
import 'package:mbshr_project/features/menu/data/models/menu_item.dart';
import 'package:mbshr_project/features/menu/ui/widgets/item_card.dart';

class ItemsList extends StatelessWidget {
  final List<MenuItem> items;
  final void Function(int index) onFavoriteToggle;

  const ItemsList({
    super.key,
    required this.items,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) => ItemCard(
        item: items[index],
        onFavoriteToggle: () => onFavoriteToggle(index),
      ),
    );
  }
}
