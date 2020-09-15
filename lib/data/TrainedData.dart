class TrainedData {
  /* キー 　　　　　*/ final int id;
  /* タイトル      */ final String title;
  /* ポケモン番号   */ final int pokemonId;
  /* 性格 　　　　　*/ final int personality;
  /* 素早さ努力値　 */ final int effortValue;
  /* 持ち物　　 　　*/ final int scarfFlag;

  TrainedData({this.id, this.title, this.pokemonId, this.personality, this.effortValue, this.scarfFlag});


  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "pokemonId": this.pokemonId,
      "personality": this.personality,
      "effortValue": this.effortValue,
      "scarfFlag": this.scarfFlag,
    };
  }
}
