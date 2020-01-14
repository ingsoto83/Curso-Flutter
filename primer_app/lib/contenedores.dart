import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Contenedores extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Contenedores", style: TextStyle(
            fontSize: 42.0,
            fontFamily: 'Signatra'),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
           // height: 240,
            //width: 240,
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/imagen1.jpg'),
                    fit: BoxFit.fill
                ),
            ),
          ),
          Container(
            height: 240,
            width: 240,
            child: Text("Prueba de contenedores",
              style: TextStyle(fontSize: 30,
                  color: Colors.white),
            )
          )
        ],
      ),
    );
  }
}