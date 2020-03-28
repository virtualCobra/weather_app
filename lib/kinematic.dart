import 'package:flutter/material.dart';
import 'JsonAPILinker.dart';
import 'textStyles.dart';


class Kinematic extends StatefulWidget {
  
  @override
  KinematicState createState() => KinematicState();
}

class KinematicState extends State<Kinematic> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Daily weather"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => print("menu button tapped")),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
              child: new Image.asset("images/autumnbackgrounf.png",
                  width: 490, height: 1300, fit: BoxFit.cover)),
          new Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.fromLTRB(0, 8, 10, 0),
              child: Text("hello", style: cityStyle())),
          new Container(
              padding: EdgeInsets.symmetric(vertical: 250, horizontal: 100),
              child: Image.asset("images/weatherIcon.png")),
          new Container(
            color:Colors.black,
            padding:EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(30, 470, 50, 00),
            child: updateTemp("delhi")
            
          )
        ],
      ),
    );
  }
}

