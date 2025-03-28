import 'package:fashion_nova_clone/models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    // Mock data for demonstration
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Product(
        id: 1,
        name: 'Nova Curve Jeans',
        price: 49.99,
        imageUrl: 'https://images.unsplash.com/photo-1543076447-215ad9ba6923',
        sizes: ['S', 'M', 'L', 'XL'],
        colors: ['#000000', '#FF2D55', '#FFFFFF'],
        rating: 4.5,
        reviewCount: 128,
        isNew: true,
      ),
      Product(
        id: 2,
        name: 'Basic Tee',
        price: 19.99,
        imageUrl: 'https://images.unsplash.com/photo-1517841905240-472988d4b3c7',
        sizes: ['S', 'M', 'L'],
        colors: ['#FFFFFF', '#000000'],
        rating: 4.0,
        reviewCount: 75,
        isNew: false,
      ),
      // Add more products as needed
    ];
  }
}