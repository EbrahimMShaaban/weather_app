import 'package:permission_handler/permission_handler.dart';

class LocationPermission{

  Future<void> requestLocationPermission()async{
    bool granted = await _checkPermission();
    if(granted){
      return;
    }else{
      await Permission.location.request();
      await requestLocationPermission();
    }
  }

  Future<bool> _checkPermission()async{
    //var status = await Permission.location.status;
    if(await Permission.location.isGranted){
      return true;
    }else{
      return false;
    }
  }
}