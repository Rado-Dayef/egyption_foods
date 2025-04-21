import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  String email = AppStrings.emptySign;
  bool isResetPasswordClicked = false;
  GlobalKey<FormState> resetPasswordFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = AppStrings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isResetPasswordClicked) {
      resetPasswordFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To send the reset password email to the user email.
  Future<void> resetPassword() async {
    isLoading = true;
    isResetPasswordClicked = true;
    checkFields();
    if (resetPasswordFormStateKey.currentState!.validate()) {
      resetPasswordFormStateKey.currentState!.save();
      String? response = await FirebaseAuthService().resetPassword(email);
      if (response != null) {
        response.showToast;
      } else {
        AppStrings.pleaseCheckYourInternetConnectionToast.showToast;
      }
    }
    isLoading = false;
    update();
  }
}
