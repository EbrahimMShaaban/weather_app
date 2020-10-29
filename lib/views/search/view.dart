import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            enableSuggestions: true,
            onSubmitted: (String value){},
          )
        ],
      ),
    );
  }
}
