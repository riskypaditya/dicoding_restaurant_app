import 'package:dicoding_restaurant_app/list_restaurant_app.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => {
              Navigator.pushReplacementNamed(
                  context, ListRestaurantApp.routeName)
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.restaurant_menu_sharp, size: 100, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Restaurant App',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 30, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
