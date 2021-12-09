import 'package:cuco_health_app/modules/home_page/controller/home_page_controller.dart';
import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  // PersonController controllerCharacter = Get.find();
  static const NAVIGATOR_KEY = 1;

  static const INDEX_PAGE_EXIT = 2;

  final _pages = ['/perfil', '/amigos'];
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    if (page != _pageIndex.value) {
      _pageIndex(page);
      Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
    }
  }
}
