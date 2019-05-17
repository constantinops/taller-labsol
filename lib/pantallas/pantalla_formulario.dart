import 'package:flutter/material.dart';


class PantallaFormulario extends StatefulWidget {
  @override
  _PantallaFormularioState createState() => _PantallaFormularioState();
}

class _PantallaFormularioState extends State<PantallaFormulario> {
  TextEditingController _controller = TextEditingController(text: 'Luis');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _controller,
              onSaved: (String str) {
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle)
              ),
              validator: (String str) {
                if (str.length < 8) {
                  return 'El campo no puede estar vacio';
                }
              },
            ),
            RaisedButton(
              child: Text('Enviar'),
              onPressed: () {
                _formKey.currentState.validate();
              },
            )
          ],
        ),
      ),
    );
  }
}
