
import 'package:flutter/material.dart';
import 'MainBody.dart';

// ----------------------------------
// クラス名　: MainPage
// 処理概要　: メイン画面
// ----------------------------------
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("素早さ計算"),
        ),
        body: MainBody(),
      ),
    );
  }
}
