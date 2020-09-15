import 'package:calc_speed/widget/MainPage.dart';
import 'package:calc_speed/widget/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'notifier/ResultNotifier.dart';
import 'notifier/MyselfNotifier.dart';
import 'state/MyselfState.dart';
import 'notifier/OpponentNotifier.dart';
import 'state/OpponentState.dart';
import 'state/ResultState.dart';

// ----------------------------------
// メソッド名: main
// 処理概要　: メインメソッド
// ----------------------------------
void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      StateNotifierProvider<OpponentStateNotifier, OpponentState>(
        create: (context) => OpponentStateNotifier(),
      ),
      StateNotifierProvider<MyselfStateNotifier, MyselfState>(
          create: (context) => MyselfStateNotifier()
      ),
      StateNotifierProvider<ResultStateNotifier, ResultState>(
          create: (context) => ResultStateNotifier()
      ),
    ],
  ));
}

// ----------------------------------
// クラス名　: MyApp
// 処理概要　: アプリケーション
// ----------------------------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'トレナビ',
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        "/": (_) => SplashPage(),
        "/main": (_) => MainPage(),
      },
    );
  }
}
