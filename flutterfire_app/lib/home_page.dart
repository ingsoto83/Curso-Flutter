import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('books').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return new Text('Loading...');
              default:
                return new ListView(
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    String title = document['title'];
                    String year = document['year'];
                    return new ListTile(
                      onLongPress: (){
                        Firestore.instance.collection("books").document(document.documentID).delete();
                      },
                      onTap: (){
                        Firestore.instance.collection("books").document(document.documentID).updateData({
                          'favorite' : !document['favorite']
                        });
                      },
                      title: new Text("$title - $year"),
                      subtitle: new Text(document['author']),
                      leading: Container(
                        //height: 100,
                        //width: 100,
                        child: Image.network(document['img'])
                      ),
                      trailing: document['favorite'] ? Icon(Icons.favorite, color: Colors.red,) : Icon(Icons.favorite_border)
                    );
                  }).toList(),
                );
            }
          },
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
