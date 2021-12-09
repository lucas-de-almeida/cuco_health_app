import 'package:cuco_health_app/modules/home_page/bindings/home_page_binding.dart';
import 'package:cuco_health_app/modules/home_page/view/home_page.dart';
import 'package:cuco_health_app/modules/menu_page/controller/menu_controller.dart';
import 'package:cuco_health_app/modules/person_page/bindings/person_binding.dart';
import 'package:cuco_health_app/modules/person_page/view/person_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: const Color(0xFF2296F3),
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pefil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_sharp),
              label: 'Amigos',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/perfil',
        key: Get.nestedKey(MenuController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/perfil') {
            return GetPageRoute(
                settings: settings,
                page: () => const HomePage(),
                binding: HomePageBinding());
          }
          if (settings.name == '/amigos') {
            return GetPageRoute(
                settings: settings,
                page: () => const PersonPage(),
                binding: PersonBinding());
          }
          return null;
        },
      ),
    );
  }
}
