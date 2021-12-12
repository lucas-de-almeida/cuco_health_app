import 'package:cuco_health_app/modules/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

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
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 8.0, top: 16),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      clipBehavior: Clip.antiAlias,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: controller.profile!.avatar,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFc8e2f7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: Get.width * 0.8,
                  height: Get.height * 0.38,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Column(
                      children: [
                        Text(
                          controller.profile!.name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          "Quantidade de projetos no github",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${controller.profile!.publicRepo}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          "Descrição:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          controller.profile!.bio,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Text('Email de contato'),
                        Text(controller.profile!.email)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Column(
                  children: [
                    Text('Informações disponibilizadas por Github'),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/images/github.png',
                            height: Get.height * 0.08,
                            width: Get.width * 0.15,
                          )),
                    ),
                  ],
                )
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
