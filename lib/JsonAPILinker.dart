import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'textStyles.dart';

//var sampleURL ="https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=8a5d5a4287b457081c1a32e12d5e236b";
var default_key = "8a5d5a4287b457081c1a32e12d5e236b";
var default_city = "london";

Future<Map> getAllData(String city) async {
  var api =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$default_key&units=metric";

  var data = await http.get(api);
  var jsonData = jsonDecode(data.body);
  return jsonData;
}

Widget updateTempPanel(String city) {
  return new FutureBuilder(
    future: getAllData(city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      //print("0");
      if (snapshot.hasData) {
        Map content = snapshot.data;
        //  print("1");
        String temp = content['main']['temp'].toString();
        String weather = content["weather"][0]["main"].toString();
        String humid = content["main"]["humidity"].toString();
        //print(temp);
        return new Container(
          
          
          
          
            child: new Column(children: <Widget>[
          new ListTile(title: Text("TEMPRATURE : " + temp +"C", style: tempStyle())),
          new ListTile(title: Text("SKY                   : " + weather, style: tempStyle())),
          new ListTile(title: Text("HUMIDITY        : " + humid, style: tempStyle()))
          //  new ListTile(ti)
        ]));
      } else {
        return new Container(child: Text("error"));
      }
    },
  );
}
