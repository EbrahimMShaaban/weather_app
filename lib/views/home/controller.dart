import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/views/home/model.dart';

class HomeController {
  Future<HomeModel> getData() async {
    const String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=31&lon=30&appid=be2acbcfe99b5fe0e4e59c3b35c3dd23';
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    HomeModel _homeModel = HomeModel(
      description: decodedData['weather'][0]['description'],
      temp: decodedData['main']['temp'],
      humi: decodedData['main']['humidity'],
      windSpeed: decodedData['wind']['speed'],
      cityName: decodedData['name'],
    );
    return _homeModel;
  }
}
