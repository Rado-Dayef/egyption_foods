import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/models/food_model.dart';
import 'package:egyption_foods/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// To add new user to users collection.
  static Future<dynamic> uploadUser(UserModel user) async {
    try {
      await _firestore.collection(AppStrings.usersCollection).doc(user.email).set(user.asMap());
      return user;
    } catch (error) {
      return error.toString();
    }
  }

  /// To fetch the current user date.
  static Future<dynamic> fetchCurrentUser() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      try {
        DocumentSnapshot userDoc = await _firestore.collection(AppStrings.usersCollection).doc(currentUser.email).get();
        if (userDoc.exists) {
          UserModel user = UserModel.asModel(userDoc.data() as Map<String, dynamic>);
          return user;
        } else {
          return AppStrings.unknownErrorToast;
        }
      } catch (error) {
        return error.toString();
      }
    } else {
      UserModel user = UserModel(AppStrings.guestText, fav: [], cart: [], email: AppStrings.guestText);
      return user;
    }
  }

  /// To fetch foods date.
  static Future<dynamic> fetchFoods() async {
    try {
      QuerySnapshot foodDocs = await _firestore.collection(AppStrings.foodsCollection).get();

      if (foodDocs.docs.isNotEmpty) {
        List<FoodModel> foods =
            foodDocs.docs.map((doc) {
              return FoodModel.asModel(doc.data() as Map<String, dynamic>);
            }).toList();
        return foods;
      } else {
        return AppStrings.unknownErrorToast;
      }
    } catch (error) {
      return error.toString();
    }
  }

  /// To update user favorite food.
  static Future<dynamic> updateUserFavFood(String foodId) async {
    try {
      final userRef = FirebaseFirestore.instance.collection(AppStrings.usersCollection).doc(_firebaseAuth.currentUser!.email);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(userRef);

        List<dynamic> currentFavorites = snapshot.data()?[AppStrings.favField] ?? [];

        if (!currentFavorites.contains(foodId)) {
          currentFavorites.add(foodId);
          transaction.update(userRef, {AppStrings.favField: currentFavorites});
        } else {
          currentFavorites.remove(foodId);
          transaction.update(userRef, {AppStrings.favField: currentFavorites});
        }
      });
      return true;
    } catch (error) {
      return error.toString();
    }
  }

  /// To update user cart food.
  static Future<dynamic> updateUserCartFood(String foodId) async {
    try {
      final userRef = FirebaseFirestore.instance.collection(AppStrings.usersCollection).doc(_firebaseAuth.currentUser!.email);

      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(userRef);

        List<dynamic> currentCart = snapshot.data()?[AppStrings.cartField] ?? [];

        if (!currentCart.contains(foodId)) {
          currentCart.add(foodId);
          transaction.update(userRef, {AppStrings.cartField: currentCart});
        } else {
          currentCart.remove(foodId);
          transaction.update(userRef, {AppStrings.cartField: currentCart});
        }
      });
      return true;
    } catch (error) {
      return error.toString();
    }
  }
}
