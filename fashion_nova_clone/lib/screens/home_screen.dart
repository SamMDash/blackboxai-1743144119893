import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_nova_clone/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashion_nova_clone/bloc/product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FASHION NOVA'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                viewportFraction: 1.0,
              ),
              items: [
                'https://images.unsplash.com/photo-1483985988355-763728e1935b',
                'https://images.unsplash.com/photo-1542295669297-4d352b042bca',
                'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3',
              ].map((imageUrl) {
                return CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Categories Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: List.generate(8, (index) {
                return const Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Text('Category'),
                  ],
                );
              }),
            ),
            const SizedBox(height: 20),
            // Featured Products
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'NEW ARRIVALS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('SEE ALL'),
                ],
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(child: Text(state.error!));
                }
                return SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: state.products[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
