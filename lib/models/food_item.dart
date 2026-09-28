class FoodItem {
  final String id;
  final String imgUrl;
  final String name;
  final double price;
  final bool isFavorite;
  final String categoryId;

  FoodItem({
    required this.imgUrl,
    required this.name,
    required this.price,
    this.isFavorite = false,
    required this.categoryId,
    required this.id,
  });

  FoodItem copyWith({
    String? imgUrl,
    String? name,
    double? price,
    bool? isFavorite,
    String? categoryId,
    String? id,
  }) {
    return FoodItem(
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    id: 'burger 1',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/welcome-patty-burger-patty-burger-26.png',
    name: 'Beef Burger',
    price: 7.5,
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 2',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-Transparent-Image.png',
    name: 'Chicken Burger',
    price: 7,
    categoryId: '1',
  ),
  FoodItem(
    id: 'burger 3',
    imgUrl: 'https://www.pngmart.com/files/16/Cheese-Burger-Transparent-PNG.png',
    name: 'Cheese Burger',
    price: 6,
    categoryId: '1',
  ),
  FoodItem(
    id: 'pizza 1',
    imgUrl:
        'https://static.vecteezy.com/system/resources/thumbnails/058/697/566/small/delicious-buffalo-chicken-pizza-on-transparent-background-free-png.png',
    name: 'Chicken Pizza',
    price: 15,
    categoryId: '2',
  ),
  FoodItem(
    id: 'pasta 1',
    imgUrl:
        'https://www.freepnglogos.com/uploads/noodles-png/noodles-company-menu-noodles-pasta-salads-more-13.png',
    name: 'Pasta',
    price: 8,
    categoryId: '3',
  ),
  FoodItem(
    id: 'pasta 2',
    imgUrl:
        'https://www.freepnglogos.com/uploads/noodles-png/noodles-company-menu-noodles-pasta-salads-more-13.png',
    name: 'Pasta2',
    price: 8,
    categoryId: '4',
  ),
  FoodItem(
    id: 'pasta 3',
    imgUrl:
        'https://www.freepnglogos.com/uploads/noodles-png/noodles-company-menu-noodles-pasta-salads-more-13.png',
    name: 'Past3',
    price: 8,
    categoryId: '5',
  ),
  FoodItem(
    id: 'pasta 4',
    imgUrl:
        'https://www.freepnglogos.com/uploads/noodles-png/noodles-company-menu-noodles-pasta-salads-more-13.png',
    name: 'Pasta4',
    price: 8,
    categoryId: '6',
  ),
];
