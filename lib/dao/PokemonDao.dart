import 'package:path/path.dart';
import 'package:calc_speed/data/PokemonData.dart';
import 'package:sqflite/sqflite.dart';

// ---------------------------------
// 変数の宣言
// ---------------------------------
/* ポケモンDB */
Future<Database> database;

// ---------------------------------
// 接続用メソッド
// ---------------------------------
Future createPokemon() async {
  database = openDatabase(
    join(await getDatabasesPath(), 'pokemon_database.db'),
    onCreate: (db, version) {
      return db.execute(
        // テーブルを生成するSQL
        "CREATE TABLE pokemon(" + "id INTEGER PRIMARY KEY, " + "name TEXT, " + "h INTEGER, " + "a INTEGER, " + "b INTEGER, " + "c INTEGER, " + "d INTEGER, " + "s INTEGER, " + "typeId1 INTEGER, " +"typeId2 INTEGER, " +"charaId1 INTEGER, " + "charaId2 INTEGER," + "charaId3 INTEGER" + ")",
      );
    },
    version: 1,
  );
}

// ---------------------------------
// 存在判定メソッド(id)
// ---------------------------------
Future<bool> existsPokemonById(int id) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'pokemon',
    where: "id = ?",
    whereArgs: [id],
  );

  if (maps.length != 0) {
    return true;
  } else {
    return false;
  }
}

// ---------------------------------
// 存在判定メソッド(name)
// ---------------------------------
Future<bool> existsPokemonByName(String name) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'pokemon',
    where: "name = ?",
    whereArgs: [name],
  );

  if (maps.length != 0) {
    return true;
  } else {
    return false;
  }
}

// ---------------------------------
// 取得メソッド(id)
// ---------------------------------
Future<List<PokemonData>> getPokemonById(int id) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'pokemon',
    where: "id = ?",
    whereArgs: [id],
  );

  return List.generate(maps.length, (i) {
    return PokemonData(
      id: maps[i]['id'],
      name: maps[i]['name'],
      h: maps[i]['h'],
      a: maps[i]['a'],
      b: maps[i]['b'],
      c: maps[i]['c'],
      d: maps[i]['d'],
      s: maps[i]['s'],
      typeId1: maps[i]['typeId1'],
      typeId2: maps[i]['typeId2'],
      charaId1: maps[i]['charaId1'],
      charaId2: maps[i]['charaId2'],
      charaId3: maps[i]['charaId3'],
    );
  }).toList();
}

// ---------------------------------
// 取得メソッド(name)
// ---------------------------------
Future<List<PokemonData>> getPokemonByName(String name) async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query(
    'pokemon',
    where: "name = ?",
    whereArgs: [name],
  );

  return List.generate(maps.length, (i) {
    return PokemonData(
      id: maps[i]['id'],
      name: maps[i]['name'],
      h: maps[i]['h'],
      a: maps[i]['a'],
      b: maps[i]['b'],
      c: maps[i]['c'],
      d: maps[i]['d'],
      s: maps[i]['s'],
      typeId1: maps[i]['typeId1'],
      typeId2: maps[i]['typeId2'],
      charaId1: maps[i]['charaId1'],
      charaId2: maps[i]['charaId2'],
      charaId3: maps[i]['charaId3'],
    );
  }).toList();
}

// ---------------------------------
// 取得メソッド(name)
// ---------------------------------
Future<List<PokemonData>> getPokemonName() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query('pokemon');

  return List.generate(maps.length, (i) {
    return maps[i]['name'];
  }).toList();
}

// ---------------------------------
// 登録用メソッド
// ---------------------------------
Future<void> insertPokemon(PokemonData pokemon) async {
  final Database db = await database;
  await db.insert(
    'pokemon',
    pokemon.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// ---------------------------------
// 削除用メソッド
// ---------------------------------
Future<void> deletePokemon(int id) async {
  final db = await database;
  await db.delete(
    'pokemon',
    where: "id = ?",
    whereArgs: [id],
  );
}
