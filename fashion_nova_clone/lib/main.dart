import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashion_nova_clone/bloc/product_bloc.dart';
import 'package:fashion_nova_clone/screens/home_screen.dart';
import 'package:fashion_nova_clone/services/product_repository.dart';

void main() {
  runApp(const FashionNovaApp());
}

class FashionNovaApp extends StatelessWidget {
  const FashionNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(LoadProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Fashion Nova Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
