import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String _email;
  String _password;
  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _submitForm(){
    if(validateAndSave()){
       FirebaseAuth.instance.signInWithEmailAndPassword(
           email: _email,
           password: _password)
           .then((AuthResult result){
             if(result.user!=null){
               Navigator.push(this.context,
                   MaterialPageRoute(builder: (context) => HomePage()));
             }

       });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: FlutterLogo(size: 100,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
                child: Text(
                  "FlutterBooks",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.none,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Curso Flutter ITS",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 15.0, left: 15.0),
                child: new Form(
                    key: formKey,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.account_circle,color: Colors.white),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                    ),
                                    width: 250,
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Usuario",
                                            fillColor: Colors.white,
                                            filled: true),
                                        validator: (value) => value.isEmpty
                                            ? "Correo no puede estar vacío!"
                                            : null,
                                        onSaved: (value) => _email = value,
                                        style: TextStyle(
                                            fontSize: 18.0, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 300,
                            child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.blue,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.vpn_key,color: Colors.white),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0)),
                                      ),
                                      width: 250,
                                      height: 60,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Contraseña",
                                              fillColor: Colors.white,
                                              filled: true),
                                          validator: (value) => value.isEmpty
                                              ? "Contraseña no puede estar vacía!"
                                              : null,
                                          obscureText: true,
                                          onSaved: (value) => _password = value,
                                          style: TextStyle(
                                              fontSize: 18.0, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20, left: 8, right: 8),
                          child: Container(
                            width: 300,
                            child: Container(
                                height: 130,
                                padding: EdgeInsets.all(40),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  child: Text("Entrar", style: TextStyle(color: Colors.white,fontSize: 18),),
                                  onPressed: () => _submitForm(),
                                )
                            )
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }

}
