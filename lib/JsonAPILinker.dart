import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'textStyles.dart';

//var sampleURL ="https://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=8a5d5a4287b457081c1a32e12d5e236b";
var defaultKey = "8a5d5a4287b457081c1a32e12d5e236b";
var defaultCity = "patiala";

Future<Map> getAllData(String city) async {
  var api =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$defaultKey&units=metric";

  var data = await http.get(api);
  var jsonData = jsonDecode(data.body);
  return jsonData;
}

Widget updateTempPanel(String city) {
  return new FutureBuilder(
    future: getAllData(city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      //print("0");

      Map content = snapshot.data;
      //  print("1");

      //print(temp);
      if (content["message"].toString() == "city not found" ||
          content["message"].toString() == "nothing to geocode") {
        return new Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Please update  city", style: errMessageStyle()),
                Text("Current city NOT FOUND", style: errMessageStyle())
              ],
            ));
      } else {
        String temp = content['main']['temp'].toString();
        String weather = content["weather"][0]["main"].toString();
        String humid = content["main"]["humidity"].toString();
        return new Container(
          child: new Column(
            children: <Widget>[
              new ListTile(
                  title:
                      Text("TEMPRATURE : " + temp + "C", style: tempStyle())),
              new ListTile(
                  title: Text("SKY                   : " + weather,
                      style: tempStyle())),
              new ListTile(
                  title: Text("HUMIDITY        : " + humid, style: tempStyle()))
              //  new ListTile(ti)
            ],
          ),
        );
      }
    },
  );
}
