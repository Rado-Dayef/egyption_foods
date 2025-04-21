import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/models/food_model.dart';
import 'package:egyption_foods/models/services/firebase_services.dart';
import 'package:egyption_foods/models/user_model.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  /// To get the data.
  Future<void> getData() async {
    dynamic fetchFoodsResponse = await FirebaseServices.fetchFoods();
    dynamic fetchUserResponse = await FirebaseServices.fetchCurrentUser();
    await Future.delayed(5.sec, () {
      if (fetchFoodsResponse is List<FoodModel> && fetchUserResponse is UserModel) {
        Get.offNamed(AppStrings.homeRoute, arguments: [fetchUserResponse, fetchFoodsResponse]);
      } else {
        fetchFoodsResponse.toString().showToast;
        fetchUserResponse.toString().showToast;
      }
    });
  }
}
