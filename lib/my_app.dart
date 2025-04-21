import 'package:egyption_foods/constants/bindings.dart';
import 'package:egyption_foods/constants/colors.dart';
import 'package:egyption_foods/constants/pages.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.lightBlueColor));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      getPages: AppPages.appPages,
      theme: ThemeData(
        fontFamily: AppStrings.timesFont,
        primaryColor: AppColors.goldColor,
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        scaffoldBackgroundColor: AppColors.lightParchmentToneColor,
        appBarTheme: AppBarTheme(color: AppColors.lightBlueColor, iconTheme: IconThemeData(color: AppColors.goldColor)),
      ),
      initialBinding: AppBindings(),
      initialRoute: FirebaseAuth.instance.currentUser != null ? AppStrings.splashRoute : AppStrings.loginRoute,
    );
  }
}
