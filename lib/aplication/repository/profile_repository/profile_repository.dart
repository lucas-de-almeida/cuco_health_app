import 'package:cuco_health_app/aplication/rest_client/rest_client.dart';
import 'package:cuco_health_app/models/profile.dart';
import 'package:get/get.dart';

class ProfileRepository {
  final RestClient _restClient;
  ProfileRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  Future<Profile?> findProfile() async {
    var url = 'https://api.github.com/users/lucas-de-almeida';

    final result = await _restClient.get<Profile?>(url, decoder: (data) {
      var resultData = data;

      if (resultData != null) {
        return resultData = Profile.fromMap(data);
      } else {
        Get.snackbar('erro', 'message');
        throw Exception();
      }
    });
    if (result.hasError) {
      throw Exception('Erro ao buscar characters');
    }
    return result.body;
  }
}
