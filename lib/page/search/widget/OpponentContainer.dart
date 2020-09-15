import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:calc_speed/module/MainModule.dart';
import 'package:calc_speed/module/PokemonModule.dart';
import 'package:calc_speed/notifier/ResultNotifier.dart';
import 'package:calc_speed/notifier/opponent/OpponentState.dart';
import '../../../notifier/opponent/OpponentNotifier.dart';
import 'package:provider/provider.dart';

import 'OpponentSettingDialog.dart';

class OpponentContainer extends StatelessWidget {
  OpponentContainer({Key key}) : super(key: key);

  // formキー
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 存在するポケモンかを判定した結果を格納
  bool _validateError = false;

  // 候補にマッチする文字列をリストから取得する
  // pokemonList ... 候補となる文字列一覧(別クラスで定義)
  List<String> _getSuggestions(String query) {
    List<String> matches = List();

    matches.addAll(pokemonList);

    matches.retainWhere((s) => s.contains(hiraToKana(query)));
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        color: Colors.black12,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(labelText: "相手のポケモン名"),
                      // テキストボックスに値を入力するたびに起動
                      onChanged: (value) async {
                        _validateError = await textFieldValidate(value);
                        _formKey.currentState.validate();
                      },

                      controller: Provider.of<OpponentState>(context, listen: true).nameController
                    ),

                    // 入力した値にマッチングするものを取得
                    suggestionsCallback: (pattern) {
                      return _getSuggestions(pattern);
                    },

                    // マッチング結果を画面に表示
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },

                    transitionBuilder: (context, suggestionsBox, controller) {
                      return suggestionsBox;
                    },

                    // 候補をタップしたときに起動
                    onSuggestionSelected: (suggestion) async {
                      Provider.of<OpponentStateNotifier>(context, listen: false).setName(suggestion);
                      _validateError = await textFieldValidate(suggestion);
                      _formKey.currentState.validate();
                    },

                    // テキストへの入力を確定したときに起動
                    onSaved: (value) async {
                      Provider.of<OpponentStateNotifier>(context, listen: false).setName(value);
                      _validateError = await textFieldValidate(value);
                      _formKey.currentState.validate();
                    },

                    // 存在するポケモン名が入力されているかをチェック
                    // ignore: missing_return
                    validator: (_) {
                      if (!_validateError) {
                        return "存在するポケモンを入力してください";
                      } else {
                        Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                      }
                    })
              ),
              Row(
                children: <Widget>[
                  Text("補正"),
                  Container(
                    width: 100.0,
                    child: Text(
                      Provider.of<OpponentState>(context, listen: true).correnction.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // TextField(),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      Provider.of<OpponentStateNotifier>(context, listen: false).addCorrection();
                      Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                    onPressed: () {
                      Provider.of<OpponentStateNotifier>(context, listen: false).removeCorrection();
                      Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      opponentSettingDialog(context);
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("スカーフ(1.5)"),
                      value: Provider.of<OpponentState>(context, listen: true).scarfFlag,
                      onChanged: (_) {
                        Provider.of<OpponentStateNotifier>(context, listen: false).changeScarf();
                        Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("追い風(2.0)"),
                      value: Provider.of<OpponentState>(context, listen: true).tailWindFlag,
                      onChanged: (_) {
                        Provider.of<OpponentStateNotifier>(context, listen: false).changeTail();
                        Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("麻痺(0.5)"),
                      value: Provider.of<OpponentState>(context, listen: true).paralysisFlag,
                      onChanged: (_) {
                        Provider.of<OpponentStateNotifier>(context, listen: false).changeParalysys();
                        Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: Text("天候(2.0)"),
                      value: Provider.of<OpponentState>(context, listen: true).weatherFlag,
                      onChanged: (_) {
                        Provider.of<OpponentStateNotifier>(context, listen: false).changeWeather();
                        Provider.of<ResultStateNotifier>(context, listen: false).changeOpponent(Provider.of<OpponentState>(context, listen: false).nameController.text, Provider.of<OpponentState>(context, listen: false).correnction, Provider.of<OpponentState>(context, listen: false).scarfFlag, Provider.of<OpponentState>(context, listen: false).tailWindFlag, Provider.of<OpponentState>(context, listen: false).paralysisFlag, Provider.of<OpponentState>(context, listen: false).weatherFlag);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}