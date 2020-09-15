import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calc_speed/module/SplashModule.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初期設定
    initialize().then((_) => Navigator.pushReplacementNamed(context, "/main"));

    return Scaffold(
      body: Center(
        child: Text("データ読み込み中")
      )
    );
  }
}
