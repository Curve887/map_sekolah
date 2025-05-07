import 'package:get/get.dart';

import '../controllers/detail_sekolah_controller.dart';

class DetailSekolahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSekolahController>(
      () => DetailSekolahController(),
    );
  }
}
