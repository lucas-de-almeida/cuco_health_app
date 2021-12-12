import 'package:get/get.dart';

class MenuController extends GetxController {
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
