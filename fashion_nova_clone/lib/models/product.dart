class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final List<String> sizes;
  final List<String> colors;
  final double rating;
  final int reviewCount;
  final bool isNew;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.colors,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isNew = false,
    this.isFavorite = false,
  });
}