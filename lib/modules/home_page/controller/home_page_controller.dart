import 'package:cuco_health_app/aplication/repository/profile_repository/profile_repository.dart';
import 'package:cuco_health_app/aplication/rest_client/rest_client.dart';
import 'package:cuco_health_app/aplication/ui/messages/messages_mixin.dart';
import 'package:cuco_health_app/models/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

RestClient rClient = RestClient();

class HomePageController extends GetxController with MessagesMixin, StateMixin {
  var personRepository = ProfileRepository(restClient: rClient);

  final message = Rxn<MessageModel>();
  Profile? profile;

  @override
  void onInit() {
    super.onInit();
    messageListener(message);
  }

  @override
  void onReady() async {
    profile = await initialCall();

    super.onReady();
  }

  Future<Profile?> initialCall() {
    return getPerson().then(
      (value) {
        if (value != null) {
          change(value, status: RxStatus.success());
          return value;
        } else {
          change(null, status: RxStatus.empty());
          return null;
        }
      },
    );
  }

  Future<Profile?> getPerson() async {
    Profile? profile;
    try {
      profile = await personRepository.findProfile();

      if (profile != null) {
        print(profile);
        return profile;
      }
    } catch (e, s) {
      debugPrint('$s');
      debugPrint('$e');
      message(MessageModel.error(
          title: 'Alerta', message: 'Falha ao buscar perfil de usuario'));
    }
    return null;
  }
}
