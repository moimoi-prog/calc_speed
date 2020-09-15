import 'package:calc_speed/dao/PokemonDao.dart';
import 'PokemonModule.dart';


// 初期処理
Future initialize() async {
  // ポケモンテーブルを生成
  await createPokemon();

  // ポケモンテーブルにデータを登録
  await registerPokemon();
}