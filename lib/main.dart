import 'package:cuco_health_app/modules/home_page/bindings/home_page_binding.dart';
import 'package:cuco_health_app/modules/home_page/view/home_page.dart';
import 'package:cuco_health_app/routes/my_pages.dart';
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
      getPages: MyPages.pages,
      home: const HomePage(),
      initialBinding: HomePageBinding(),
    );
  }
}
