import 'package:dicoding_restaurant_app/restaurant.dart';
import 'package:dicoding_restaurant_app/color.dart';
import 'package:flutter/material.dart';

class DetailRestaurant extends StatelessWidget {
  static const String routeName = '/detail-restaurant';
  final Restaurant restaurantItem;
  const DetailRestaurant({Key? key, required this.restaurantItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/lilypads.webp'))),
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height * 0.23,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        background: Hero(
                          tag: restaurantItem.id,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(restaurantItem.pictureId)),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: builderBody(context))));
  }

  Widget builderBody(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Text(
              "Restaurant ${restaurantItem.name}",
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on),
                Text(
                  "Lokasi : ${restaurantItem.city}",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Description :",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(restaurantItem.description,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: secondaryColor,
                ),
                textAlign: TextAlign.justify),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: secondaryColor,
            ),
            const Text(
              "Food :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurantItem.menus.foods.length,
                  itemBuilder: (context, index) => itemMenu(
                      context, restaurantItem.menus.foods[index].name)),
            ),
            const Text(
              "Drink :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurantItem.menus.drinks.length,
                  itemBuilder: (context, index) => itemMenu(
                      context, restaurantItem.menus.drinks[index].name)),
            ),
          ],
        ));
  }

  Widget itemMenu(BuildContext context, String name) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Center(
            child: Icon(
              Icons.fastfood,
              size: MediaQuery.of(context).size.width * 0.25,
              color: Colors.brown,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0x99000000),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.075,
              child: Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
