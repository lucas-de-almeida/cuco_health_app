import 'package:cuco_health_app/models/person.dart';
import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:cuco_health_app/modules/person_page/view/widgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends GetView<PersonController> {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2296F3),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: controller.obx(
            (value) => ListView.builder(
              itemCount: controller.listPerson.length,
              itemBuilder: (_, index) {
                Person _person = controller.listPerson[index];
                return PersonCard(person: _person);
              },
            ),
            onLoading: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
            onError: (value) => Expanded(
              child: Center(
                child: Text('$value'),
              ),
            ),
            onEmpty: const Expanded(
              child: Center(
                child: Text('Sem informações para mostrar'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
