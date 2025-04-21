import 'package:egyption_foods/constants/strings.dart';

class UserModel {
  String name, email;
  List<String> fav, cart;

  UserModel(this.name, {required this.fav, required this.cart, required this.email});

  Map<String, dynamic> asMap() {
    Map<String, dynamic> user = {AppStrings.favField: fav, AppStrings.cartField: cart, AppStrings.nameField: name, AppStrings.emailField: email};
    return user;
  }

  factory UserModel.asModel(Map<String, dynamic> map) {
    UserModel user = UserModel(map[AppStrings.nameField], email: map[AppStrings.emailField], fav: List<String>.from(map[AppStrings.favField]), cart: List<String>.from(map[AppStrings.cartField]));
    return user;
  }
}
