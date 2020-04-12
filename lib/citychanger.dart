import 'package:flutter/material.dart';

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
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red[200], Colors.white],
                    begin: Alignment.bottomRight,
                    end: Alignment.topRight)),
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
                    onPressed: () {
                      Navigator.pop(context, {'city': _searchCity.text});
                      // UpdateCity();
                    }, // { Navigator.pop(context,{'enter': _searchcity.text)},
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
