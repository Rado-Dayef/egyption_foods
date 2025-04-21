import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/models/food_model.dart';
import 'package:egyption_foods/models/services/firebase_services.dart';
import 'package:egyption_foods/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isExpanded = false;
  num totalTotalPrice = 0;
  bool isFavLoading = false;
  bool isCartLoading = false;
  UserModel user = Get.arguments[0];
  List<FoodModel> recommendedFoodsList = [];
  String selectedScreen = AppStrings.homeText;
  List<FoodModel> foodsList = Get.arguments[1];
  String selectedCategory = AppStrings.allText;
  TextEditingController searchController = TextEditingController();
  List<String> categoriesList = [AppStrings.allText, AppStrings.mainDishesText, AppStrings.appetizersAndSidesText];
  List<FoodModel> foodsMainDishesList = Get.arguments[1].where((element) => element.category == AppStrings.mainDishesText).toList();
  List<FoodModel> foodsAppetizersAndSidesList = Get.arguments[1].where((element) => element.category == AppStrings.appetizersAndSidesText).toList();

  @override
  void onInit() {
    getRecommendedFoodsList();
    getTotalPrice();
    super.onInit();
  }

  void updateFavList(String foodId) async {
    isFavLoading = true;
    update();
    await FirebaseServices.updateUserFavFood(foodId).then((value) {
      if (value is bool && value) {
        if (!user.fav.contains(foodId)) {
          user.fav.add(foodId);
          update();
        } else {
          user.fav.remove(foodId);
          update();
        }
      } else {
        value.toString().showToast;
      }
    });
    isFavLoading = false;
    update();
  }

  void updateCartList(String foodId) async {
    isCartLoading = true;
    update();
    await FirebaseServices.updateUserCartFood(foodId).then((value) {
      if (value is bool && value) {
        if (!user.cart.contains(foodId)) {
          user.cart.add(foodId);
          update();
        } else {
          user.cart.remove(foodId);
          update();
        }
      } else {
        value.toString().showToast;
      }
    });
    isCartLoading = false;
    update();
  }

  void getTotalPrice() {
    totalTotalPrice = 0;
    for (FoodModel food in foodsList.where((food) => user.cart.contains(food.id)).toList()) {
      totalTotalPrice += food.totalPrice;
    }
  }

  void getRecommendedFoodsList() {
    foodsList.sort((a, b) => b.selled.compareTo(a.selled));
    recommendedFoodsList = foodsList.take(5).toList();
  }
}
