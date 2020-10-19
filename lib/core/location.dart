import 'package:geolocator/geolocator.dart';

class CurrentLocation{
  Future<Map<String,double>> getUserLocation()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return {
      'lat':position.latitude,
      'lng':position.longitude
    };
  }
}