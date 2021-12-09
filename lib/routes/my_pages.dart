import 'package:cuco_health_app/modules/home_page/bindings/home_page_binding.dart';
import 'package:cuco_health_app/modules/home_page/view/home_page.dart';
import 'package:cuco_health_app/modules/person_page/bindings/person_binding.dart';
import 'package:cuco_health_app/modules/person_page/view/person_page.dart';
import 'package:cuco_health_app/routes/my_routes.dart';
import 'package:get/get.dart';

class MyPages {
  static final List<GetPage> pages = [
    GetPage(
      name: MyRoutes.HOMEPAGE,
      page: () => const HomePage(),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: MyRoutes.PERSONSPAGE,
      page: () => const PersonPage(),
      bindings: [
        PersonBinding(),
      ],
    ),
  ];
}
