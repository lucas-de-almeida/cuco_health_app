import 'package:cuco_health_app/models/person.dart';
import 'package:cuco_health_app/modules/person_page/controller/person_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class PersonCard extends GetView<PersonController> {
  final Person person;

  PersonCard({
    required this.person,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.12,
              width: Get.width * 0.9,
              margin: new EdgeInsets.only(left: 46.0),
              decoration: new BoxDecoration(
                  color: Color(0xFFc8e2f7),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(8.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black54,
                      blurRadius: 5.0,
                      offset: new Offset(2.0, 5.0),
                    )
                  ]),
            ),
            Positioned(
              top: 10,
              left: Get.width * 0.3,
              child: Column(
                children: [
                  Text(
                    person.name + ' ' + person.lastName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    person.email,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 10,
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: person.imagem,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
