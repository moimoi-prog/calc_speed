import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calc_speed/module/SplashModule.dart';

// ----------------------------------
// クラス名　: SplashPage
// 処理概要　: スプラッシュ画面
// ----------------------------------
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初期設定
    initialize().then((_) => Navigator.pushReplacementNamed(context, "/main"));

    // 処理中画面
    return Scaffold(
      body: Center(
        child: Text("データ読み込み中")
      )
    );
  }
}
