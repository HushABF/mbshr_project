class MenuItem {
  final String name;
  final String description;
  final String imagePath;
  final int calories;
  final int likes;
  final double price;
  final bool isFavorite;

  const MenuItem({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.calories,
    required this.likes,
    required this.price,
    required this.isFavorite,
  });
}
