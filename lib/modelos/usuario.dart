import 'dart:convert';

class Usuario {
  String nombre;
  String correo;
  String telefono;
  String celular;
  int edad;
  String urlFoto;

  Usuario.fromJson(Map<String, dynamic> json, String size) {

    Map<String, dynamic> nombreUsuario = Map.of(json["name"]);
    nombre = " ${nombreUsuario["title"]}  ${nombreUsuario["first"]} ${nombreUsuario["last"]}";
    print(json['email']);
    correo = json['email'];
    Map<String, dynamic> jsonFoto = Map.of(json['picture']);
    urlFoto = jsonFoto[size];












    Map<String, dynamic> edadUsuario = Map.of(json["dob"]);
    edad = edadUsuario["age"];
    celular = json["cell"];
    telefono = json["phone"];




  }
}