import 'package:flutter/material.dart';
import 'package:primer_app/contenedores.dart';
import 'practica_2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Contenedores()
    );
  }
}