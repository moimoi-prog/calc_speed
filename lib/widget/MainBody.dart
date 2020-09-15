import 'package:flutter/cupertino.dart';

import 'MyselfContainer.dart';
import 'OpponentContainer.dart';
import 'ResultContainer.dart';

// ----------------------------------
// クラス名　: MainBody
// 処理概要　: メイン画面ボディ
// ----------------------------------
class MainBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // 相手ポケモン情報入力欄
          OpponentContainer(),

          // 計算結果出力欄
          ResultContainer(),

          // 自分ポケモン情報入力欄
          MyselfContainer(),
        ],
      )
    );
  }
}
