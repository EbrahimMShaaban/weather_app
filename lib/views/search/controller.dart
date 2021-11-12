import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/views/home/model.dart';

class SearchController {

  Future<void> getData(String cityName)async{
    String url = 'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=be2acbcfe99b5fe0e4e59c3b35c3dd23';
    final response = await http.get(url);
    try{
      var decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
    }catch(error){
      print(error.toString());
    }
  }

}