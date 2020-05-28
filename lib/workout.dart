import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WorkoutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF19D191))
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 50.0),
                    child: new Text("UNDER CONSTRUCTION",style: new TextStyle(fontSize: 30.0),),
                  )
            ],),
          ]
        ),
      )

    );
  }
}