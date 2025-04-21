import 'package:egyption_foods/constants/colors.dart';
import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/controllers/splash_controller.dart';
import 'package:egyption_foods/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeroWidget(
                tag: AppStrings.hieroglyphicTag,
                child: Padding(
                  padding: 25.edgeInsetsHorizontal,
                  child: Text(AppStrings.appTitleHieroglyphicText, textAlign: TextAlign.center, style: TextStyle(color: AppColors.titlesColor, fontSize: 20)),
                ),
              ),
              Padding(padding: 25.edgeInsetsHorizontal, child: Text(AppStrings.appSubTitleHieroglyphicText, textAlign: TextAlign.center, style: TextStyle(color: AppColors.titlesColor, fontSize: 20))),
            ],
          ),
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppStrings.logoImage, width: 200, height: 200),
                  25.gap,
                  Text(AppStrings.appTitle, style: TextStyle(color: AppColors.titlesColor, fontSize: 40)),
                  5.gap,
                  Text(AppStrings.appSubTitleInEnglish, style: TextStyle(color: AppColors.lightParchmentToneColor, fontSize: 16)),
                  50.gap,
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(height: 30, width: 30, child: Center(child: 30.lightLoading)),
    );
  }
}
