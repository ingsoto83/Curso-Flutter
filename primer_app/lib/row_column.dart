import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.dehaze),
        title: Text("Row y Column"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Rapidez", style: TextStyle(fontSize: 24.0, color: Colors.deepPurple.withOpacity(0.5)),),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star_half,color: Colors.green,),
              Icon(Icons.star_border,color: Colors.green,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Rapidez", style: TextStyle(fontSize: 24.0, color: Colors.deepPurple),),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star_half,color: Colors.green,),
              Icon(Icons.star_border,color: Colors.green,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Rapidez", style: TextStyle(fontSize: 24.0, color: Colors.deepPurple),),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star_half,color: Colors.green,),
              Icon(Icons.star_border,color: Colors.green,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Rapidez", style: TextStyle(fontSize: 24.0, color: Colors.deepPurple),),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star,color: Colors.green,),
              Icon(Icons.star_half,color: Colors.green,),
              Icon(Icons.star_border,color: Colors.green,),
            ],
          ),
        ],
      ),
    );
  }

}