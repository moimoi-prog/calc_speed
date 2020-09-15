import 'package:calc_speed/page/MainPage.dart';
import 'package:calc_speed/page/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'notifier/result/ResultNotifier.dart';
import 'notifier/myself/MyselfNotifier.dart';
import 'notifier/myself/MyselfState.dart';
import 'notifier/opponent/OpponentNotifier.dart';
import 'notifier/opponent/OpponentState.dart';
import 'notifier/result/ResultState.dart';

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
// メソッド名: MyApp
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
