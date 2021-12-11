import 'package:cuco_health_app/modules/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quem sou eu ?'),
      ),
      body: Center(
        child: Container(
          child: controller.obx(
            (value) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(40),
                      ),
                      child: CircleAvatar(
                        maxRadius: 60,
                        child: Image.network(controller.profile!.avatar),
                      ),
                    ),
                  ),
                
                Text(controller.profile!.name),
                Text("Quantidade de projetos no github"),
                Text('${controller.profile!.publicRepo}'),
                Text("Descrição:"),
                Text(controller.profile!.bio),
                Text('Email de contato'),
                Text(controller.profile!.email)
              ],
            ),
            onLoading: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            onError: (value) => Expanded(
              child: Center(
                child: Text('$value'),
              ),
            ),
            onEmpty: Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                        'Sem informações para mostrar, por favor reinicie o aplicativo'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
