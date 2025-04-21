import 'package:egyption_foods/constants/strings.dart';

class FoodModel {
  int count = 1;
  num rate, price, selled, totalPrice;
  String id, image, title, subTitle, category, description;

  FoodModel(
    this.id, {
    required this.rate,
    required this.title,
    required this.price,
    required this.image,
    required this.selled,
    required this.subTitle,
    required this.category,
    required this.totalPrice,
    required this.description,
  });

  factory FoodModel.asModel(Map<String, dynamic> map) {
    FoodModel user = FoodModel(
      totalPrice: map[AppStrings.priceField],
      map[AppStrings.idField],
      rate: map[AppStrings.rateField],
      title: map[AppStrings.titleField],
      price: map[AppStrings.priceField],
      image: map[AppStrings.imageField],
      selled: map[AppStrings.selledField],
      subTitle: map[AppStrings.subTitleField],
      category: map[AppStrings.categoryField],
      description: map[AppStrings.descriptionField],
    );
    return user;
  }
}
