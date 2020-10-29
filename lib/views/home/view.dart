import 'package:flutter/material.dart';
import 'package:weather_app/core/permissions.dart';
import 'package:weather_app/views/home/controller.dart';
import 'package:weather_app/views/home/model.dart';
import 'package:weather_app/views/search/view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController _homeController = HomeController();
  LocationPermission _permission = LocationPermission();
  HomeModel _homeModel;
  bool _isLoading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    await _permission.requestLocationPermission();
    _homeModel = await _homeController.getData();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getData,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> SearchView())),
            )
          ],
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
          width: double.infinity,
              child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('${_homeModel.cityName}'),
                    Text('${_homeModel.description}'),
                    Text('${_homeModel.temp}'),
                    Text('${_homeModel.humi}'),
                    Text('${_homeModel.windSpeed}'),
                  ],
                ),
            ),
      ),
    );
  }
}

// int _counter = 0 ;
// int _storedCounter;
//
// void storeCounter(int c)async{
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   _prefs.setInt('counter', c);
//   print('stored');
// }
//
// void getCounter()async{
//   SharedPreferences _prefs =await SharedPreferences.getInstance();
//   setState(() {
//     _storedCounter = _prefs.getInt('counter');
//   });
//   print(_storedCounter);
// }

/*

Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$_counter'),
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: (){
              setState(() {
                _counter++;
              });
            },
          ),
          RaisedButton(
            child: Text('Get'),
            onPressed: (){
              getCounter();
            },
          ),
          RaisedButton(
            child: Text('Store'),
            onPressed: (){
              storeCounter(_counter);
            },
          ),
          Text('Stored counter : $_storedCounter'),
        ],
      )

 */
