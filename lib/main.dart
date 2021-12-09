import 'package:cuco_health_app/modules/menu_page/bindings/menu_binding.dart';
import 'package:cuco_health_app/modules/menu_page/view/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      initialBinding: MenuBinding(),
    );
  }
}
