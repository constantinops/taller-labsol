import 'package:flutter/material.dart';
import 'package:api_usuarios/pantallas/pantalla_cupertino.dart';



class PantallaStateful extends StatefulWidget {
  @override
  _PantallaStatefulState createState() => _PantallaStatefulState();
}

class _PantallaStatefulState extends State<PantallaStateful> {
  int contador = 1;
  String hora = '';
  initState() {
    super.initState();
    Stream.periodic(
      Duration(seconds: 1),
        (int veces) {
        setState(() {
          DateTime fecha = DateTime.now();
          hora = '${fecha.hour} : ${fecha.minute} : ${fecha.second}';
        });
        return veces;
        }
    ).listen((n){return 0;});
  }
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla con Estado'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('El valor del contador es $contador'),
            Text('la hora es: $hora')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            contador = contador + 1;
          });
        },
      ),
    );
  }
}


