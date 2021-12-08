import 'package:get/get.dart';

class RestClient extends GetConnect {
  RestClient() {
    httpClient.baseUrl = 'https://randomuser.me/api/?results=10';
  }
}
