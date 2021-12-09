import 'package:cuco_health_app/aplication/rest_client/rest_client.dart';
import 'package:cuco_health_app/models/person.dart';
import 'package:get/get.dart';

late List<Person> listPerson;

class PersonRepository {
  final RestClient _restClient;
  PersonRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  Future<List<Person?>?> findPerson() async {
    var url = 'https://randomuser.me/api/?results=15';

    final result = await _restClient.get<List<Person?>>(url, decoder: (data) {
      final resultData = data["results"];
      if (resultData != null) {
        return resultData
            .map<Person>((person) => Person.fromMap(person))
            .toList();
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
