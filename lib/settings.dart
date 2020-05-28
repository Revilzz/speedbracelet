import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'globals.dart' as globals;

class SettingsPage extends StatelessWidget{
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
                    child: new Text("Warn me at this speed:",style: new TextStyle(fontSize: 30.0),),
                  )
            ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SliderContainer()//Slider baren
              ],
              
            )
          ]
        ),
      )

    );
  }
}

class SliderContainer extends StatefulWidget{//Här börjar det för slider baren
  @override
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  static double _lowervalue = 30.0;
  static double _uppervalue = 120.0;
  double speed = globals.speed;

 // RangeValues values = RangeValues(_lowervalue, _uppervalue);

  @override
  Widget build(BuildContext context){
    return Slider(
      min: _lowervalue,
      max: _uppervalue,
      value: globals.speed,
      onChanged: (val){
        setState(() => globals.speed = val);
        setState(() => speed = globals.speed);
      },
      divisions: 9,
      label: "$speed",
    );
    
  }
}
