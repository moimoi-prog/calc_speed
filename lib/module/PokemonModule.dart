import 'package:flutter/services.dart';
import 'package:calc_speed/dao/PokemonDao.dart';
import 'package:calc_speed/data/PokemonData.dart';

List<String> pokemonList;

Future registerPokemon() async {
  pokemonList = List<String>();

  String csv = await rootBundle.loadString("assets/pokemon.csv");

  for (String line in csv.split("\r\n")) {
    // カンマ区切りで各列のデータを配列に格納
    List rows = line.split(','); // split by comma

    pokemonList.add(rows[1]);

    // ポケモンデータを生成
    PokemonData pokemon = PokemonData(
        // id
        id: int.parse(rows[0]),
        // 名前
        name: rows[1],
        // HP
        h: int.parse(rows[2]),
        // 攻撃
        a: int.parse(rows[3]),
        // 防御
        b: int.parse(rows[4]),
        // 特攻
        c: int.parse(rows[5]),
        // 特防
        d: int.parse(rows[6]),
        // 素早さ
        s: int.parse(rows[7]),
        // タイプ1
        typeId1: int.parse(rows[8]),
        // タイプ2
        typeId2: int.parse(rows[9]),
        // 特性1
        charaId1: int.parse(rows[10]),
        // 特性2
        charaId2: int.parse(rows[11]),
        // 特性2
        charaId3: int.parse(rows[12]));

    await insertPokemon(pokemon);
  }
}

// name ... ポケモン名
// individualValue ... 個体値
// effortValue ... 努力値
// personality ... 性格補正
// correction ... 補正
// scarf ... スカーフ
// wind ... 追い風
// paralisys ... 麻痺
// weather ... 天気
Future<int> calcSpeed(String name, int individualValue, int effortValue, double personality, int correction, bool scarf, bool wind, bool paralisys, bool weather) async {
  // 素早さ実数値の計算式
  // {(種族値×2+個体値+努力値÷4)×レベル÷100+5}×せいかく補正

  // 種族値を取得
  List<PokemonData> pokemonList = await getPokemonByName(name);
  int raceValue = pokemonList[0].s;

  // 素早さを計算
  int result = (effortValue / 4).floor();
  result = (raceValue) * 2 + individualValue + result;
  result = (result * 50 / 100).floor();
  result = result + 5;
  result = (result * personality).floor();

  // ランク補正を反映
  switch (correction) {
    case 6:
      result = (result * 4.0).floor();
      break;
    case 5:
      result = (result * 3.5).floor();
      break;
    case 4:
      result = (result * 3.0).floor();
      break;
    case 3:
      result = (result * 2.5).floor();
      break;
    case 2:
      result = (result * 2.0).floor();
      break;
    case 1:
      result = (result * 1.5).floor();
      break;
    case 0:
      result = (result * 1).floor();
      break;
    case -1:
      result = (result * 0.66).floor();
      break;
    case -2:
      result = (result * 0.50).floor();
      break;
    case -3:
      result = (result * 0.40).floor();
      break;
    case -4:
      result = (result * 0.33).floor();
      break;
    case -5:
      result = (result * 0.28).floor();
      break;
    case -6:
      result = (result * 0.25).floor();
      break;
  }

  // スカーフ判定
  if (scarf) {
    result = (result * 1.5).floor();
  }

  // 追い風判定
  if (wind) {
    result = (result * 2.0).floor();
  }

  // 麻痺判定
  if (paralisys) {
    result = (result * 0.5).floor();
  }

  // 天候判定
  if (weather) {
    result = (result * 2.0).floor();
  }

  return result;
}
