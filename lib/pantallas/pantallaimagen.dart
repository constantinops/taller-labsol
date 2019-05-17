import 'package:flutter/material.dart';

class PantallaImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Panatallaimagen"),

      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 50.0, bottom: 10.0, right: 50.0),
              child: Image.asset("assets/images/imagdos.jpg"),
              margin: EdgeInsets.only(top:10),
            ),
            Container(

              child: Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 20.0,left: 100.0,right: 100.0),
                child: Image.asset("assets/images/imguno.jpg"),
              ),

            ),

          ],
        )
      ),
    );
  }
}
