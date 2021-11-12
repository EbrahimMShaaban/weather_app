import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/views/search/controller.dart';
import 'package:http/http.dart' as http;
class SearchView extends StatelessWidget {
  final SearchController _searchController = SearchController();
  TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _editingController,
            enableSuggestions: true,
            onTap: ()async=> await deleteData(),
            onSubmitted: (value)async{
              if(value.isNotEmpty){
                await _searchController.getData(value);
                await postData(value);
                _editingController.clear();
              }
            },
          ),
          RaisedButton(
            child: Text('delete'),
            onPressed: ()=> deleteData(),
          ),
        ],
      ),
    );
  }

  Future<void> postData(String date)async{
    final String url = 'https://news-350e0.firebaseio.com/posts.json';
    await http.patch(url,body: jsonEncode({
      'city':date
    }));
  }

  void deleteData()async{
    // String url = 'https://news-350e0.firebaseio.com/posts/-MKoaiIiU2b0HQ2Ra8MS/city.json';
    // try{
    //   await http.delete(url);
    // }catch(e){
    //   print(e);
    // }
    int x;
    await Future.delayed(Duration(seconds: 3),(){x = 1;});
    print(x);
  }

}
