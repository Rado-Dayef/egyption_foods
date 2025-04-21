import 'package:egyption_foods/controllers/home_controller.dart';
import 'package:egyption_foods/controllers/login_controller.dart';
import 'package:egyption_foods/controllers/reset_password_controller.dart';
import 'package:egyption_foods/controllers/signup_controller.dart';
import 'package:egyption_foods/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
  }
}
