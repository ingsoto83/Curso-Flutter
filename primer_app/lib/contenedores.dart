import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primer_app/my_home_page.dart';
import 'practica_2.dart';

class Contenedores extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
/*      appBar: AppBar(
        title: Text("Contenedores", style: TextStyle(
            fontSize: 42.0,
            fontFamily: 'Signatra'),
        ),
      ),*/
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/imagen3.jpg'),
                    fit: BoxFit.fill
                ),
            ),
          ),
          Center(
            child:Container(
                height: 100,
                color: Colors.black.withOpacity(0.5),
            )
          ),
          Center(
            child: Text("Prueba de contenedores",
              style: TextStyle(fontSize: 50,
                color: Colors.white, fontFamily: 'Signatra'),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.arrow_forward, color: Colors.white,),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> new MyHomePage(title:"Ejemplo de Rutas",name: "Alejandro")));
        },
      ),
    );
  }
}