import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonPage extends GetView<PersonController> {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonPage'),
      ),
      body: Container(),
    );
  }
}
