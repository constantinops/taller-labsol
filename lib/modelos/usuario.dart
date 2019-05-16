import 'dart:convert';

class Usuario {
  String nombre;
  String correo;
  String telefono;
  String celular;
  int edad;
  String urlFoto;

  Usuario.fromJson(Map<String, dynamic> json, String size) {
    print(json['email']);
    correo = json['email'];
    Map<String, dynamic> jsonFoto = Map.of(json['picture']);
    urlFoto = jsonFoto[size];
  }
}