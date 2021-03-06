import 'package:flutter/material.dart';
import 'package:weather_app/citychanger.dart';
import 'JsonAPILinker.dart';
import 'textStyles.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String city = "Karnal";
  Future cityUpdate(BuildContext context) async {
    Map newCity = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new CityChanger();
        },
      ),
    );
    if (newCity != null &&
        newCity.containsKey('city') &&
        newCity['city'].toString() != "") {
      print(newCity['city']);
      city = newCity["city"].toString();
    } else {
      city = " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Daily weather"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => cityUpdate(context),
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
              child: new Image.asset("images/darkBAckground.png",
                  width: 490, height: 1300, fit: BoxFit.cover)),
          new Container(
            child: Column(
              children: <Widget>[
                new Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.fromLTRB(0, 8, 10, 0),
                    child: Text("knk", style: cityStyle())),
                new Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 140, 0, 50),
                  child: Text(
                    city,
                    style: boldTitle(),
                  ),
                ),

                //   child: Image.asset("images/weatherIcon.png")),
                new Container(
                    //color: Colors.black,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(10, 60, 10, 00),
                    child: updateTempPanel(city))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
