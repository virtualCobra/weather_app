import 'package:flutter/material.dart';
import 'home.dart' as home;

class CityChanger extends StatefulWidget {
  @override
  _CityChangerState createState() => _CityChangerState();
}

class _CityChangerState extends State<CityChanger> {
  @override
  Widget build(BuildContext context) {
    var _searchCity = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Select the city"),
        backgroundColor: Colors.red,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              "images/autumnbackgrounf.png",
              fit: BoxFit.cover,
              height: 1300,
            ),
          ),
          new ListView(
            children: <Widget>[
              ListTile(
                  title: new TextField(
                keyboardType: TextInputType.text,
                controller: _searchCity,
                decoration: new InputDecoration(hintText: "enter city"),
              )),
              ListTile(
                title: RaisedButton(
                    
                     onPressed: (){
                       Navigator.pop(context,{'city':_searchCity.text});
                       
                     // UpdateCity();
                     },// { Navigator.pop(context,{'enter': _searchcity.text)},
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.red),
              )
            ],
          ),
        ],
      ),
    );
  }
}
