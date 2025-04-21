import 'package:egyption_foods/constants/extensions.dart';
import 'package:egyption_foods/constants/strings.dart';
import 'package:egyption_foods/views/screens/check_out_screen.dart';
import 'package:egyption_foods/views/screens/details_screen.dart';
import 'package:egyption_foods/views/screens/login_screen.dart';
import 'package:egyption_foods/views/screens/nev_screen.dart';
import 'package:egyption_foods/views/screens/reset_password_screen.dart';
import 'package:egyption_foods/views/screens/signup_screen.dart';
import 'package:egyption_foods/views/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: AppStrings.checkOutRoute, page: () => const CheckOutScreen(), transition: Transition.noTransition),
    GetPage(name: AppStrings.homeRoute, page: () => const NavScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.loginRoute, page: () => const LoginScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.splashRoute, page: () => const SplashScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.signupRoute, page: () => const SignUpScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.detailsRoute, page: () => const DetailsScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
    GetPage(name: AppStrings.resetPasswordRoute, page: () => const ResetPasswordScreen(), transition: Transition.noTransition, transitionDuration: 1.sec),
  ];
}
