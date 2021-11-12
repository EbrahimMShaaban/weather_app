import 'package:flutter/cupertino.dart';

class WeatherModel {
  final String description;
  final double temp;
  final int humi;
  final double windSpeed;
  final String cityName;

  WeatherModel({
    @required this.description,
    @required this.temp,
    @required this.humi,
    @required this.windSpeed,
    @required this.cityName,
  });
}
