import 'package:calc_speed/state/ResultState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ----------------------------------
// クラス名　: ResultContainer
// 処理概要　: 自分ポケモン情報入力欄
// ----------------------------------
class ResultContainer extends StatelessWidget {
  ResultContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Text(""),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text("最遅"),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text("無補正"),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text("準速"),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text("最速"),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Text("相手"),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).opponentSlowest.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).opponentUncorrected.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).opponentFaster.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).opponentFastest.toString()),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Text("自分"),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).myselfSlowest.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).myselfUncorrected.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).myselfFaster.toString()),
                  )
              ),
              Expanded(
                  child: Container(
                    child: Text(Provider.of<ResultState>(context, listen: true).myselfFastest.toString()),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}