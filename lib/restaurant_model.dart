import 'dart:convert';

import 'package:dicoding_restaurant_app/restaurant.dart';

parseRestaurant(String? json) {
  if (json == null) {
    return {"restaurants": []};
  }
  Map parsed = jsonDecode(json);
  return parsed;
}

class RestaurantModel {
  List<Restaurant> restaurants;
  RestaurantModel({
    required this.restaurants,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurants: List<Restaurant>.from(
          json["restaurants"].map((x) => Restaurant.fromJson(x))),
    );
  }
}
