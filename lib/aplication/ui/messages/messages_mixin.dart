import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.dialog(Dialog(
          child: Container(
            height: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  model.title,
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  model.message,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.back();
                    },
                    child: Text('Voltar'))
              ],
            ),
          ),
        ));
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;
  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });
  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;
  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[300] ?? Colors.red;

      case MessageType.info:
        return Colors.blue[600] ?? Colors.blue;
    }
  }
}
