import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cupertino extends StatefulWidget {
  @override
  _cupertinoState createState() => _cupertinoState();
}

class _cupertinoState extends State<cupertino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          //backgroundColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text("home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble),
              title: Text("chat"),

            ),

          ],

        ),
        tabBuilder: (context , index){
          return CupertinoTabView(

            builder:(context){
              switch(index){
                case 0:
                  return BotonHome();
                case 1:
                  return BotonChat();
                default:
                  return null;
              }

            },
          );
        },
      ),
    );
  }
}
class BotonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(

            largeTitle: Text("home",style: TextStyle(fontSize: 30.0,color: Colors.amber),),
            leading: Icon(CupertinoIcons.book),
            middle: Text("bienvenido",style: TextStyle(fontSize: 50.0,color: Colors.lightBlue),),
            trailing: Icon(CupertinoIcons.add_circled),
          ),




        ],
      ),
    );
  }
}
class BotonChat extends StatefulWidget {
  @override
  _BotonChatState createState() => _BotonChatState();
}

class _BotonChatState extends State<BotonChat> {

  var _var=50.0;
  var _sw=false;
  @override
  Widget build(BuildContext context) {
    return  CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("pantalla dos"),
        trailing: Icon(CupertinoIcons.back),
        leading: Icon(CupertinoIcons.battery_full),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CupertinoButton(
              child: Text("boton"),
              onPressed: (){

              },
              color: Colors.green,
            ),
            CupertinoSwitch(
              value: _sw,
              onChanged: (bool value){
                setState(()=>_sw=value);
              },
            ),
            Text("pantallas 2"),

            CupertinoSlider(
              value: _var,
              min: 0,
              max: 100,
              onChanged: (double value){
                setState(()=>_var=value);
              },
              activeColor: Colors.deepPurple,

            ),

          ],
        ),
      ),
      
    );
  }
}




