import 'package:cuco_health_app/modules/home_page/controller/home_page_controller.dart';
import 'package:cuco_health_app/routes/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
          child: Container(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(MyRoutes.PERSONSPAGE);
          },
          child: Text('ir pra outra tela'),
        ),
      )),
    );
  }
}
