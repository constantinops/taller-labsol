import 'package:flutter/material.dart';
import 'package:api_usuarios/pantallas/pantalla_stateful.dart';
import 'package:api_usuarios/pantallas/pantalla_cupertino.dart';


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

class PantallaPrincipal extends StatelessWidget {
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
                  Icon(Icons.account_circle),
                  Text('Luis Enrque'),
                  Text('luisortranirez2211@gmail.com')
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
          Navigator.push(
            contexto,
            MaterialPageRoute(builder: (context) => PantallaStateful()),
          );

        },      ),
    );
  }
}


