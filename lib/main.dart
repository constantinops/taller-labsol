import 'package:flutter/material.dart';
import 'package:api_usuarios/pantallas/pantalla_stateful.dart';
import 'package:api_usuarios/pantallas/pantalla_cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:api_usuarios/modelos/usuario.dart';
import 'dart:convert';
import 'package:api_usuarios/pantallas/pantallaimagen.dart';

void main() => runApp(Aplicacion());

class Aplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        brightness: Brightness.dark,
        accentColor: Colors.amber,
        buttonColor: Colors.deepPurple,


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


  int set=0;

  //dddd

/*
  _slect(int pos){
    Switch(pos){
      case 0:
        return cupertino();
        case 1:
          return PantallaStateful();


    }

  }

*/

  Usuario _usuario;

  /// Metodo que se ejecuta cuando se crea por primera vez
  /// la pantalla
  initState() {
    super.initState();
    obtenerUsuario();
  }

  Widget build(BuildContext contexto) {



    int _index = 0;






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
                  Text(_usuario == null ? "Sin datos" : _usuario.nombre),
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
            ),
            ListTile(
              title: Text('Pantalla imagen'),
              onTap: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(builder: (context) => PantallaImagen()),
                );
              },
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: obtenUsuarios(),
        initialData: null,
        builder: (BuildContext localContext, AsyncSnapshot<List<Usuario>> result){
          if (!result.hasData || result.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Usuario> usuarios = result.data;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (BuildContext ctx, int indice) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(usuarios[indice].urlFoto),
                  ),
                  title: Text(usuarios[indice].nombre),
                  subtitle: Text(usuarios[indice].correo),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text(usuarios[indice].nombre),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Correo: ${usuarios[indice].correo}"),
                                Text("Edad: ${usuarios[indice].edad}"),
                                Text("Celular: ${usuarios[indice].celular}"),
                                Text("Telefono: ${usuarios[indice].telefono}"),
                              ],
                            ),
                          );
                        }
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
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


  Future<List<Usuario>> obtenUsuarios() async {
    http.Response response = await http.get("https://randomuser.me/api?results=100");
    Map<String, dynamic> json = jsonDecode(response.body);
    List jsonUsuarios = json["results"] as List;
    List<Usuario> usuarios = [];
    for (var jsonUsuario in jsonUsuarios) {
      Map<String, dynamic> datosUsuario = Map.of(jsonUsuario);
      usuarios.add(Usuario.fromJson(datosUsuario, "thumbnail"));
    }
    return usuarios;
  }

  Future<void> cambiaUsuarioActual() async {
    http.Response response = await http.get("https://randomuser.me/api");
    Map<String, dynamic> json = jsonDecode(response.body);
    List jsonUsuarios = json["results"] as List;
    Usuario usuario = Usuario.fromJson(Map.of(jsonUsuarios[0]), "large");
    setState(() {
      _usuario = usuario;
    });
  }
}



