// ---------------------------------
// ポケモンデータモデル
// ---------------------------------
class PokemonData {
  // 変数
  /* ポケモン番号 */ final int id;
  /* ポケモン名　 */ final String name;
  /* 種族値() */ final int h;
  /* 種族値() */ final int a;
  /* 種族値() */ final int b;
  /* 種族値() */ final int c;
  /* 種族値() */ final int d;
  /* 種族値() */ final int s;
  /* タイプ1 */ final int typeId1;
  /* タイプ2 */ final int typeId2;
  /* 特性1 */ final int charaId1;
  /* 特性2 */ final int charaId2;
  /* 特性3 */ final int charaId3;

  // デフォルトコンストラクタ
  PokemonData({this.id, this.name, this.h, this.a, this.b, this.c, this.d, this.s, this.typeId1, this.typeId2, this.charaId1, this.charaId2, this.charaId3});

  // マップとして返す
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "name": this.name,
      "h": this.h,
      "a": this.a,
      "b": this.b,
      "c": this.c,
      "d": this.d,
      "s": this.s,
      "typeId1": this.typeId1,
      "typeId2": this.typeId2,
      "charaId1": this.charaId1,
      "charaId2": this.charaId2,
      "charaId3": this.charaId3,
    };
  }
}
