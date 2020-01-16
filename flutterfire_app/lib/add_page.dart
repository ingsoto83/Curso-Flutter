import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'book.dart';

class AddPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  final GlobalKey _keyForm = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  Book _newBook = new Book();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        leading: Icon(Icons.library_books),
        title: Text("Agregar libro"),
      ),
      body: SafeArea(
        child: Form(
          key: _keyForm,
          child: ListView(
            children: <Widget>[
              new TextFormField(
                validator: (val)=> val.isEmpty ? "Nombre es requerido!": null,
                onSaved: (val)=> _newBook.title=val,
                decoration: InputDecoration(
                  icon: Icon(Icons.comment),
                  hintText: "Escribe el nombre del libro",
                  labelText: "Nombre",
                ),
              ),
              new TextFormField(
                validator: (val)=> val.isEmpty ? "Autor es requerido!": null,
                onSaved: (val)=> _newBook.author=val,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: "Escribe el autor del libro",
                    labelText: "Autor"
                ),
              ),
              new TextFormField(
                validator: (val)=> val.isEmpty ? "Año es requerido!": null,
                onSaved: (val)=> _newBook.year=val,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    hintText: "Escribe el año del libro",
                    labelText: "Año"
                ),
              ),
              Container(
                height: 130,
                padding: EdgeInsets.all(40),
                child: RaisedButton(
                  color: Colors.red,
                  child: Text("Guardar", style: TextStyle(color: Colors.white,fontSize: 22),),
                  onPressed: () => _submitForm(),
                )
              )
            ]
          )
        )
      )
    );
  }
  void _submitForm(){
    final FormState formState = _keyForm.currentState;
    if(!formState.validate()){
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text("Completa todos los campos!"),
      ));
    }else{
      formState.save();
      Firestore.instance.collection("books").document().setData({
        'title': _newBook.title,
        'author': _newBook.author,
        'year':_newBook.year,
        'img': "https://firebasestorage.googleapis.com/v0/b/flutter-its.appspot.com/o/libro1.jpg?alt=media&token=df5dfb71-da0f-4472-818f-2fb619d5ed3f",
        'favorite': false
      }).whenComplete((){
        _scaffoldkey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          content: Text("Guardado correctamente!"),
        ));
      });
    }
  }
}