import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          primary: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.grey[300],

        appBarTheme: AppBarTheme(backgroundColor: Colors.grey[300]),
        dividerTheme: DividerThemeData(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.black,
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.deepOrange),
        fontFamily: 'OpenSans',
      ),
      routes: {
        '/': (context) => const BottomNavbarPage(),
        FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
      },
    );
  }
}
