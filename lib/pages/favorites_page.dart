import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood = food
        .where((foodItem) => foodItem.isFavorite == true)
        .toList();

    if (favoriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/empty_state.png',
              height: isLandscape ? size.height * 0.4 : size.height * 0.4,
            ),
            Text(
              'No Favorite Items Found!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            int targetedIndex = food.indexOf(favoriteFood[index]);
            Navigator.of(context)
                .pushNamed(
                  FoodDetailsPage.routeName,
                  arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                )
                .then((value) {
                  setState(() {});
                  debugPrint(
                    'The value retunrned in favorites page is: $value',
                  );
                });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Image.network(
                    favoriteFood[index].imgUrl,
                    height: isLandscape
                        ? size.height * 0.20
                        : size.height * 0.070,
                    width: isLandscape
                        ? size.height * 0.30
                        : size.height * 0.090,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favoriteFood[index].name,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: isLandscape
                                    ? FontWeight.w800
                                    : FontWeight.w600,
                                fontSize: isLandscape ? 25 : 22,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$ ${favoriteFood[index].price}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: isLandscape
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final targetedItem = favoriteFood[index];
                      int targetedIndex = food.indexOf(targetedItem);
                      setState(() {
                        food[targetedIndex] = food[targetedIndex].copyWith(
                          isFavorite: false,
                        );
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: isLandscape
                          ? size.height * 0.1
                          : size.height * 0.035,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
