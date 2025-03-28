import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashion_nova_clone/models/product.dart';

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

class ToggleFavorite extends ProductEvent {
  final int productId;

  ToggleFavorite(this.productId);
}

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  ProductState({
    required this.products,
    this.isLoading = false,
    this.error,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(products: [])) {
    on<LoadProducts>(_onLoadProducts);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    
    try {
      // Mock data - in real app this would come from API
      final products = [
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
        // Add more products here
      ];
      
      emit(state.copyWith(products: products, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void _onToggleFavorite(
    ToggleFavorite event,
    Emitter<ProductState> emit,
  ) {
    final updatedProducts = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));
  }
}

extension on Product {
  Product copyWith({
    bool? isFavorite,
  }) {
    return Product(
      id: id,
      name: name,
      price: price,
      imageUrl: imageUrl,
      sizes: sizes,
      colors: colors,
      rating: rating,
      reviewCount: reviewCount,
      isNew: isNew,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}