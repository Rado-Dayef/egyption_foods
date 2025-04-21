import 'package:egyption_foods/constants/colors.dart';
import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/controllers/signup_controller.dart';
import 'package:egyption_foods/views/widgets/form_field_widget.dart';
import 'package:egyption_foods/views/widgets/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueColor,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          HeroWidget(
            tag: AppStrings.hieroglyphicTag,
            child: Padding(padding: 25.edgeInsetsHorizontal, child: Text(AppStrings.signUpHieroglyphicText, textAlign: TextAlign.center, style: TextStyle(color: AppColors.titlesColor, fontSize: 20))),
          ),
          SafeArea(
            child: Padding(
              padding: 10.edgeInsetsAll,
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: controller.signUpFormStateKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(tag: AppStrings.logoTag, child: Center(child: Image.asset(AppStrings.logoImage, height: 150, width: 150))),
                        10.gap,
                        const HeroWidget(tag: AppStrings.titleTag, child: Text(AppStrings.appTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 40, color: AppColors.titlesColor))),
                        20.gap,
                        const HeroWidget(
                          tag: AppStrings.subTitleTag,
                          child: Text(AppStrings.signUpText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lightParchmentToneColor)),
                        ),
                        10.gap,
                        HeroWidget(
                          tag: AppStrings.emailTag,
                          child: FormFieldWidget(
                            padding: 0,
                            placeholder: AppStrings.nameText,
                            prefixIcon: const Icon(Icons.person_outline),
                            onSaved: (String? value) {
                              controller.name = value!.trim();
                              controller.update();
                            },
                            onChanged: (_) {
                              controller.checkFields();
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.nameText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                              } else if (value.length < 4) {
                                return AppStrings.nameText + AppStrings.spaceSign + AppStrings.lessThen4Validation;
                              } else if (value.length > 24) {
                                return AppStrings.nameText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                              }
                              return null;
                            },
                          ),
                        ),
                        10.gap,
                        FormFieldWidget(
                          padding: 0,
                          placeholder: AppStrings.emailText,
                          prefixIcon: const Icon(Icons.email_outlined),
                          onSaved: (String? value) {
                            controller.email = value!.trim();
                            controller.update();
                          },
                          onChanged: (_) {
                            controller.checkFields();
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.emailText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                            } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) || !RegExp(r"^[^@.]$").hasMatch(value[value.length - 1]) || RegExp(r'[^\w@.]').hasMatch(value)) {
                              return AppStrings.invalidEmailValidation;
                            } else if (!value.contains(AppStrings.atSign)) {
                              return AppStrings.emailDoesNotContainAtValidation;
                            }
                            return null;
                          },
                        ),
                        10.gap,
                        HeroWidget(
                          tag: AppStrings.passwordTag,
                          child: GetBuilder<SignUpController>(
                            builder: (_) {
                              return FormFieldWidget(
                                padding: 0,
                                placeholder: AppStrings.passwordText,
                                obscure: controller.obscure,
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    controller.obscure = !controller.obscure;
                                    controller.update();
                                  },
                                  child: Icon(controller.obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                ),
                                onSaved: (String? value) {
                                  controller.password = value!.trim();
                                  controller.update();
                                },
                                onChanged: (_) {
                                  controller.checkFields();
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.isRequiredValidation;
                                  } else if (value.length < 8) {
                                    return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.lessThen8Validation;
                                  } else if (value.length > 24) {
                                    return AppStrings.passwordText + AppStrings.spaceSign + AppStrings.largerThen24Validation;
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                        ),
                        20.gap,
                        HeroWidget(
                          tag: AppStrings.buttonTag,
                          child: Center(
                            child: GetBuilder<SignUpController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: controller.isLoading ? () {} : controller.signUp,
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(borderRadius: 15.borderRadiusAll, border: Border.all(color: AppColors.lightParchmentToneColor)),
                                    child:
                                        controller.isLoading
                                            ? 30.lightLoading
                                            : const Text(AppStrings.signUpText, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.lightParchmentToneColor)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        10.gap,
                        HeroWidget(
                          tag: AppStrings.textButtonTag,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.alreadyHaveAnAccountText, style: TextStyle(fontSize: 16, color: AppColors.lightParchmentToneColor)),
                              InkWell(
                                onTap: () => Get.offNamed(AppStrings.loginRoute),
                                child: Container(
                                  padding: 8.edgeInsetsAll,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    AppStrings.loginText + AppStrings.questionSign,
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.lightParchmentToneColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
