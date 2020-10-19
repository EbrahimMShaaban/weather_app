import 'package:flutter/cupertino.dart';

class HomeModel {
  final String description;
  final double temp;
  final int humi;
  final double windSpeed;
  final String cityName;

  HomeModel({
    @required this.description,
    @required this.temp,
    @required this.humi,
    @required this.windSpeed,
    @required this.cityName,
  });
}
