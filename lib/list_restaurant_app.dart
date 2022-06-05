import 'package:dicoding_restaurant_app/detail_restaurant.dart';
import 'package:dicoding_restaurant_app/restaurant.dart';
import 'package:dicoding_restaurant_app/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color.dart';

class ListRestaurantApp extends StatelessWidget {
  static const String routeName = '/list-restaurant';
  const ListRestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.8,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/lilypads.webp')),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    // opacity: 0.5,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/bg.jpg')),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Restaurant App',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Recomendation Restaurant for you!',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<String>(
                future:
                    rootBundle.loadString('assets/data/local_restaurant.json'),
                builder: (context, snapshot) {
                  var jsonMap = parseRestaurant(snapshot.data);
                  var restaurant = RestaurantModel.fromJson(jsonMap);
                  return ListView.builder(
                    itemCount: restaurant.restaurants.length,
                    itemBuilder: (context, index) {
                      return _buildRestaurantItem(
                          context, restaurant.restaurants[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailRestaurant.routeName,
            arguments: restaurant);
      },
      child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Hero(
                      tag: restaurant.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          restaurant.pictureId,
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            color: secondaryColor,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        itemCard(restaurant.city, Icons.location_city),
                        const SizedBox(
                          height: 5,
                        ),
                        itemCard(restaurant.rating, Icons.star),
                      ],
                    )),
              ],
            ),
          )),
    );
  }

  Row itemCard(var value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.brown),
        Text(
          value.toString(),
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
