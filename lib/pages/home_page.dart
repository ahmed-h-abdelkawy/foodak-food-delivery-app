import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categoryChosenId;
  bool enableCategoryFilter = false;
  late List<FoodItem> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                AppAssets.classicBurgerBanner,
                height: isLandscape ? size.height * 0.90 : size.height * 0.27,
                width: isLandscape ? size.width * 0.70 : size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              height: size.height * 0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (categoryChosenId == categories[index].id ||
                            !enableCategoryFilter) {
                          enableCategoryFilter = !enableCategoryFilter;
                        }
                        if (enableCategoryFilter) {
                          categoryChosenId = categories[index].id;
                          filteredFood = food
                              .where(
                                (item) => item.categoryId == categoryChosenId,
                              )
                              .toList();
                        } else {
                          categoryChosenId = null;
                          filteredFood = food;
                        }
                      });
                    },
                    child: Container(
                      width: size.width * 0.2,
                      decoration: BoxDecoration(
                        color: categoryChosenId == categories[index].id
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Image.asset(categories[index].imgPath),
                            const SizedBox(height: 10),
                            Text(
                              categories[index].title,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color:
                                        categoryChosenId == categories[index].id
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: categories.length,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 5 : 2,
                mainAxisSpacing: size.height * 0.015,
                crossAxisSpacing: size.height * 0.015,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  final targetedFoodItem = food.firstWhere(
                    (item) => item.id == filteredFood[index].id,
                  );
                  final targetedIndex = food.indexOf(targetedFoodItem);
                  Navigator.of(context)
                      .pushNamed(
                        FoodDetailsPage.routeName,
                        arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                      )
                      .then((value) {
                        setState(() {});
                        filteredFood = food;
                        categoryChosenId = null;
                        debugPrint('The value retunrned in home: $value');
                      });
                },
                child: FoodGridItem(
                  foodIndex: index,
                  filteredFood: filteredFood,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
