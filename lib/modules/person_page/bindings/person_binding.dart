import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:get/get.dart';

class PersonBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonController(), permanent: true);
  }
}
