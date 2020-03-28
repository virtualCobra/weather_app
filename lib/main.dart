import 'package:flutter/material.dart';
import 'package:weather_app/kinematic.dart';

import 'kinematic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Kinematic(),
    );
  }
}
