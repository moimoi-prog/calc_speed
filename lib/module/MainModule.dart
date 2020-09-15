// ---------------------------
// メソッド名 ; calcSpeed
// 処理概要　 : 素早さの実数値を返す
// 引数      : double raceValue ... 種族値
//          : double individualValue ... 個体値
//          : double effortValue ... 努力値
//          : double correction ... 性格補正
//          : int level ... レベル
// 戻り値    : int realValue ... 実数値
// ---------------------------
import 'package:calc_speed/dao/PokemonDao.dart';

Future<bool> textFieldValidate(String value) async {
  if (value == null || value == "") {
    return true;
  }

  return await existsPokemonByName(value);
}

// ひらがなからカタカナへ変換
String hiraToKana(String str) {
  return str.replaceAllMapped(new RegExp("[ぁ-ゔ]"), (Match m) => String.fromCharCode(m.group(0).codeUnitAt(0) + 0x60));
}