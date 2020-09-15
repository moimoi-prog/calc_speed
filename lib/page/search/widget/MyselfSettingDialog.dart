// --------------------------------------
// アカウント登録、情報変更ダイアログ
// --------------------------------------


import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:calc_speed/enum/ResultCode.dart';
import 'package:calc_speed/notifier/result/ResultNotifier.dart';
import 'package:calc_speed/notifier/myself/MyselfNotifier.dart';
import 'package:calc_speed/notifier/myself/MyselfState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<ResultCode> myselfSettingDialog(BuildContext context) async{
  /* フォームキー      */
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  return await showDialog(
      context: context,
      builder: (BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: AlertDialog(
                  title: Text("自分のポケモンパラメータ設定"),
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "性格補正を選択",
                                style: TextStyle(
                                  // fontSize: 17,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: RadioListTile<PersonalityType>(
                                      title: Text("↓"),
                                      groupValue: Provider.of<MyselfState>(context, listen: true).personalityType,
                                      value: PersonalityType.descent,
                                      onChanged: (value) {
                                        Provider.of<MyselfStateNotifier>(context, listen: false).setPersonalityType(value);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<PersonalityType>(
                                      title: Text("-"),
                                      groupValue: Provider.of<MyselfState>(context, listen: true).personalityType,
                                      value: PersonalityType.uncorrected,
                                      onChanged: (value) {
                                        Provider.of<MyselfStateNotifier>(context, listen: false).setPersonalityType(value);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<PersonalityType>(
                                      title: Text("↑"),
                                      groupValue: Provider.of<MyselfState>(context, listen: true).personalityType,
                                      value: PersonalityType.rise,
                                      onChanged: (value) {
                                        Provider.of<MyselfStateNotifier>(context, listen: false).setPersonalityType(value);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                          "個体値を入力",
                          style: TextStyle(
                            // fontSize: 17,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 80.0,
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(labelText: "素早さ"),
                                  keyboardType: TextInputType.number,
                                  controller: Provider.of<MyselfState>(context, listen: true).individualController,
                                  // テキストボックスに値を入力するたびに起動
                                  onChanged: (value) {
                                    Provider.of<MyselfStateNotifier>(context, listen: false).setIndividual(int.parse(value));
                                    _formKey.currentState.validate();
                                  },
                                  // 存在するポケモン名が入力されているかをチェック
                                  // ignore: missing_return
                                  validator: (value) {
                                    // 最大値判定
                                    if (int.parse(value) < 0) {
                                      return "0以上の数値を入力してください。";
                                    }

                                    // 最大値判定
                                    if (int.parse(value) > 31) {
                                      return "31以下の数値を入力してください。";
                                    }
                                  }),
                            ),
                          ],
                        ),
                        Text(
                          "努力値を入力",
                          style: TextStyle(
                            // fontSize: 17,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 80.0,
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(labelText: "素早さ"),
                                  keyboardType: TextInputType.number,
                                  controller: Provider.of<MyselfState>(context, listen: true).effortValueController,
                                  // テキストボックスに値を入力するたびに起動
                                  onChanged: (value) {
                                    Provider.of<MyselfStateNotifier>(context, listen: false).setEffort(int.parse(value));
                                    _formKey.currentState.validate();
                                  },
                                  // 存在するポケモン名が入力されているかをチェック
                                  // ignore: missing_return
                                  validator: (value) {
                                    // 最大値判定
                                    if (int.parse(value) < 0) {
                                      return "0以上の数値を入力してください。";
                                    }

                                    // 最大値判定
                                    if (int.parse(value) > 252) {
                                      return "252以下の数値を入力してください。";
                                    }
                                  }),
                            ),
                            // TextField(),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.white,
                              onPressed: () {
                                Provider.of<MyselfStateNotifier>(context, listen: false).addEffort(4);
                                _formKey.currentState.validate();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                              onPressed: () {
                                Provider.of<MyselfStateNotifier>(context, listen: false).removeEffort(4);
                                _formKey.currentState.validate();
                              },
                            ),
                          ],
                        ),                    ],
                    ),
                  ),
                  // ボタンの配置
                  actions: <Widget>[
                    FlatButton(
                        child: const Text('確定'),
                        onPressed: () async{
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Provider.of<ResultStateNotifier>(context, listen: false).changeMyself(Provider.of<MyselfState>(context, listen: false).nameController.text, Provider.of<MyselfState>(context, listen: false).correnction, Provider.of<MyselfState>(context, listen: false).scarfFlag, Provider.of<MyselfState>(context, listen: false).tailWindFlag, Provider.of<MyselfState>(context, listen: false).paralysisFlag, Provider.of<MyselfState>(context, listen: false).weatherFlag, int.parse(Provider.of<MyselfState>(context, listen: false).individualController.text), int.parse(Provider.of<MyselfState>(context, listen: false).effortValueController.text), Provider.of<MyselfState>(context, listen: false).personalityType);
                            Navigator.of(context).pop();
                          }
                        }),
                    FlatButton(
                        child: const Text("キャンセル"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              )
            ]
        )),
      );
}
