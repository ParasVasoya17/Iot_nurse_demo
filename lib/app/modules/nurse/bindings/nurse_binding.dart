import 'package:get/get.dart';

import '../controllers/nurse_controller.dart';

class NurseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NurseController>(
      () => NurseController(),
    );
  }
}
