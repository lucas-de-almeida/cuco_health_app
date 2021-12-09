import 'package:cuco_health_app/modules/menu_page/controller/menu_controller.dart';
import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:get/get.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => PersonController(), fenix: true);
    Get.put(MenuController());
  }
}
