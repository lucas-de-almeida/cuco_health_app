import 'dart:convert';

class Person {
  final String name;
  final String lastName;
  final String imagem;
  Person({
    required this.imagem,
    required this.lastName,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastName': lastName,
      'imagem': imagem,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name']['first'],
      lastName: map['name']['last'],
      imagem: map['picture']['medium'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
