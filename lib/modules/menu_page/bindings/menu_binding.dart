import 'package:cuco_health_app/modules/home_page/controller/home_page_controller.dart';
import 'package:cuco_health_app/modules/menu_page/controller/menu_controller.dart';

import 'package:get/get.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MenuController());
    //Get.put(HomePageController(), permanent: true);
  }
}
