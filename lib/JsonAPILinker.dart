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

Widget updateTemp(String city) {
  return new FutureBuilder(
    future: getAllData(city),
    builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
      print("0");
      if (snapshot.hasData) {
        Map content = snapshot.data;
        print("1");
        String temp = content['main']['temp'].toString();
        print(temp);
        return new Container(
            child: new Text(
          temp,
          style: tempStyle(),
        ));
      } else {
        return new Container(child: Text("error"));
      }
    },
  );
}
