class FoodMenu {
  const FoodMenu({
    required this.id,
    required this.image,
    required this.text,
    required this.description,
  });

  final String id;
  final String image;
  final String text;
  final String description;

  static final List<FoodMenu> fakeFoodMenuValues = List.generate(
    13,
    (index) => FoodMenu(
      id: '$index',
      image: 'assets/asset_1.png',
      /* image: 'assets/img/food/food${index + 1}.png', */
      text: 'Food Item ${index + 1}',
      description:
          'L',
    ),
  );
}