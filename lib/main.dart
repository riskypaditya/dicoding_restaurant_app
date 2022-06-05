import 'package:dicoding_restaurant_app/detail_restaurant.dart';
import 'package:dicoding_restaurant_app/list_restaurant_app.dart';
import 'package:dicoding_restaurant_app/restaurant.dart';
import 'package:dicoding_restaurant_app/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        ListRestaurantApp.routeName: (context) => const ListRestaurantApp(),
        DetailRestaurant.routeName: (context) => DetailRestaurant(
            restaurantItem:
                ModalRoute.of(context)?.settings.arguments as Restaurant)
      },
    );
  }
}
