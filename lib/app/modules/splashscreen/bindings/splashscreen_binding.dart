import 'package:app_map_sekolah/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
