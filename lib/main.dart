import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'package:speedbracelet/settings.dart';
import 'package:speedbracelet/workout.dart';
import 'package:vibration/vibration.dart';
import 'globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speed Bracelet',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 170.0, 
                  width: 170.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(150.0),
                    color: Color(0xFFFF0000)
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 12.5, left: 12.5),
                  height: 145.0, 
                  width: 145.0,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(150.0),
                    color: Color(0xFFFFC400)
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.only(top: 45, left: 40),
                  height: 145.0, 
                  width: 145.0,
                  child: new Text("5/8", style: new TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold))
                )
              ]
              ),
            new Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 50.0),
                    child: new Text("Speed Bracelet",style: new TextStyle(fontSize: 30.0),),
                  )
            ],),
            Myfunc(),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutPage()));
                        },
                          child: new Container(
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(color: Color(0xFFFCC244), borderRadius: new BorderRadius.circular(10.0)),
                          child: new Text("Workout", style: new TextStyle(fontSize: 20.0,color: Colors.white))                  
                    ),
                      ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                        },
                          child: new Container(
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(color: Color(0xFFFC4A44), borderRadius: new BorderRadius.circular(10.0)),
                          child: new Text("Settings", style: new TextStyle(fontSize: 20.0,color: Colors.white))                  
                    ),
                      ),
                  ),
                )
              ],
            )          
          ]
          )
        )
    );
  }
}

class Myfunc extends StatefulWidget{
  @override
  _Myfunc createState() => _Myfunc();
}

class _Myfunc extends State {
  @override
  Widget build(BuildContext context){
  
    //return Text(globals.txt, style: new TextStyle(fontSize: 20.0,color: Colors.white));

  changetxt(){
    globals.reset = !globals.reset;
    if(globals.reset == true)
    {
      setState((){globals.txt = "Stop";});
      //getCurrentLocation();
    }
    if(globals.reset == false)
    {
      setState((){globals.txt = "Start";});
    }
  }

    return new Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          changetxt();
                        },
                          child: new Container(
                          height: 70.0,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(color: Color(0xFF1DCC40), borderRadius: new BorderRadius.circular(10.0)),
                          child: new Text(globals.txt, style: new TextStyle(fontSize: 20.0,color: Colors.white))                
                    ),
                      ),
                  ),
                )
              ],
            );
  }
}

void getCurrentLocation() async{
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted; 



  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

    location.onLocationChanged.listen((LocationData currentLocation) {
    if(currentLocation.speed > (globals.speed/3.6))
      {
        Vibration.vibrate(duration: 500);
      }   
    });



}