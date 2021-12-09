import 'package:cuco_health_app/aplication/repository/person_repository/person_repository.dart';
import 'package:cuco_health_app/aplication/rest_client/rest_client.dart';
import 'package:cuco_health_app/aplication/ui/messages/messages_mixin.dart';
import 'package:cuco_health_app/models/person.dart';
import 'package:get/get.dart';

RestClient rClient = RestClient();

class PersonController extends GetxController with MessagesMixin, StateMixin {
  var personRepository = PersonRepository(restClient: rClient);

  final message = Rxn<MessageModel>();

  final listPerson = <Person>[].obs;

  final _totalLista = 0.obs;
  int get totalLista => _totalLista.value;
  set totalLista(int newValue) => _totalLista(newValue);

  @override
  void onInit() {
    super.onInit();
    messageListener(message);

    listPerson.clear();
  }

  @override
  void onReady() async {
    initialCall();

    super.onReady();
  }

  Future<void> initialCall() {
    return getPerson().then(
      (value) {
        if (value!.isNotEmpty) {
          change(value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      },
    );
  }

  Future<List<Person?>?> getPerson() async {
    List<Person?>? person = [];
    try {
      person = await personRepository.findPerson();

      if (person != null) {
        for (var element in person) {
          print(element!.name);
          listPerson.add(element);
        }
      }

      return person;
    } catch (e, s) {
      message(MessageModel.error(
          title: 'Alerta', message: 'Falha ao buscar lista de amigos'));
    }
    return null;
  }
}
