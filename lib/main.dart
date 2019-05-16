import 'package:flutter/material.dart';
import 'package:api_usuarios/pantallas/pantalla_stateful.dart';
import 'package:api_usuarios/pantallas/pantalla_cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api_usuarios/modelos/usuario.dart';
import 'dart:convert';

void main() => runApp(Aplicacion());

class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amber
      ),
      home: PantallaPrincipal(),
    );
  }

}

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  Usuario _usuario;

  /// Metodo que se ejecuta cuando se crea por primera vez
  /// la pantalla
  initState() {
    super.initState();
    obtenerUsuario();
  }

  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  _usuario == null ?
                      Icon(Icons.account_circle) :
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(_usuario.urlFoto),
                  ),
                  Text('Luis Enrque'),
                  Text(_usuario == null ?
                      'Sin datos' : _usuario.correo
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Pantalla Cupertino'),
              onTap: () {
                Navigator.push(
                    contexto,
                    MaterialPageRoute(builder: (context) => cupertino()),);
              },
            ),
            ListTile(
              title: Text('Pantalla con estado (Stateful)'),
              onTap: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(builder: (context) => PantallaStateful()),
                );
              },
            )
          ],
        ),
      ),
      body: Center(

        child: Text('datos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
        },
      ),
    );
  }

  Future<void> obtenerUsuario() async {
    // Llamando al servidor
    http.Response respuesta = await http.get('https://randomuser.me/api');
    // Parseando respuesta Json del servidor
    Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    // Convirtiendo el campo dinamico del Json a Lista
    List usuarios = respuestaJson['results'] as List;
    // Actualizando o reconstruyendo pantalla
    print(respuestaJson);
    setState(() {
      _usuario = Usuario.fromJson(Map.of(usuarios[0]), 'large');
    });
  }
}


