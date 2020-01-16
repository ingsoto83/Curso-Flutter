import 'package:flutter/material.dart';
import 'package:flutterfire_app/add_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterFire App"),
      ),
      body: SafeArea(
        //top: false,
        //bottom: false,
        child: ListView(
          children: <Widget>[
            Center(
              child:Text("Main Content")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage()));
        },
      ),
    );
  }
}
