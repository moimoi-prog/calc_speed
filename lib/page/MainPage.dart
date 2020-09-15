
import 'package:flutter/material.dart';
import 'search/SearchTab.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("素早さ計算"),
        ),
        body: SearchTab(),
      ),
    );
  }
}
