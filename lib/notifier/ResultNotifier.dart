import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:calc_speed/module/PokemonModule.dart';
import 'package:state_notifier/state_notifier.dart';

// ------------------------------------
// クラス名　: ResultState
// クラス概要: 結果表示ComponentState
// ------------------------------------
class ResultState {
  // 変数の宣言
  // 相手用
  /* 最遅 　*/ final int opponentSlowest;

  /* 無補正 */
  final int opponentUncorrected;

  /* 準速 　*/
  final int opponentFaster;

  /* 最速 　*/
  final int opponentFastest;

  // 自分用
  /* 最遅 　*/
  final int myselfSlowest;

  /* 無補正 */
  final int myselfUncorrected;

  /* 準速 　*/
  final int myselfFaster;

  /* 最速　 */
  final int myselfFastest;

  // コンストラクタ
  ResultState(this.opponentSlowest, this.opponentUncorrected, this.opponentFaster, this.opponentFastest, this.myselfSlowest, this.myselfUncorrected, this.myselfFaster, this.myselfFastest);
}

// ------------------------------------
// クラス名　: ResultStateNotifier
// クラス概要: 結果表示ComponentNotifier
// ------------------------------------
class ResultStateNotifier extends StateNotifier<ResultState> {
  // 初期化
  ResultStateNotifier() : super(ResultState(0, 0, 0, 0, 0, 0, 0, 0));

  // 相手の値を変更
  void changeOpponent(String name, int correction, bool scarf, bool wind, bool paralisys, bool weather, [int individualValue, int effortSpeedValue, PersonalityType personality]) async {
    // 個体値を計算
    int slowestIndividual = individualValue == null ? 0 : individualValue;
    int uncorrectedIndividual = individualValue == null ? 31 : individualValue;
    int fasterIndividual = individualValue == null ? 31 : individualValue;
    int fastestIndividual = individualValue == null ? 31 : individualValue;

    // 努力値を計算
    int slowestEffort = effortSpeedValue == null ? 0 : effortSpeedValue;
    int uncorrectedEffort= effortSpeedValue == null ? 0 : effortSpeedValue;
    int fasterEffort= effortSpeedValue == null ? 252 : effortSpeedValue;
    int fastestEffort= effortSpeedValue == null ? 252 : effortSpeedValue;

    double slowestPersonality;
    double uncorrectedPersonality;
    double fasterPersonality;
    double fastestPersonality;

    // 性格補正を計算
    switch (personality) {
      case PersonalityType.descent:
        slowestPersonality = 0.9;
        uncorrectedPersonality = 0.9;
        fasterPersonality = 0.9;
        fastestPersonality = 0.9;
        break;

      case PersonalityType.uncorrected:
        slowestPersonality = 1;
        uncorrectedPersonality = 1;
        fasterPersonality = 1;
        fastestPersonality = 1;
        break;

      case PersonalityType.rise:
        slowestPersonality = 1.1;
        uncorrectedPersonality = 1.1;
        fasterPersonality = 1.1;
        fastestPersonality = 1.1;
        break;

      default:
        slowestPersonality = 0.9;
        uncorrectedPersonality = 1;
        fasterPersonality = 1;
        fastestPersonality = 1.1;
        break;

    }

    // パラメータを計算
    if (name != "" && name != null) {
      int slowest = await calcSpeed(name, slowestIndividual, slowestEffort, slowestPersonality, correction, scarf, wind, paralisys, weather);
      int uncorrected = await calcSpeed(name, uncorrectedIndividual, uncorrectedEffort, uncorrectedPersonality, correction, scarf, wind, paralisys, weather);
      int faster = await calcSpeed(name, fasterIndividual, fasterEffort, fasterPersonality, correction, scarf, wind, paralisys, weather);
      int fastest = await calcSpeed(name, fastestIndividual, fastestEffort, fastestPersonality, correction, scarf, wind, paralisys, weather);
      state = ResultState(slowest, uncorrected, faster, fastest, state.myselfSlowest, state.myselfUncorrected, state.myselfFaster, state.myselfFastest);
    } else {
      state = ResultState(0, 0, 0, 0, state.myselfSlowest, state.myselfUncorrected, state.myselfFaster, state.myselfFastest);
    }
  }

  // 自分の値を変更
  void changeMyself(String name, int correction, bool scarf, bool wind, bool paralisys, bool weather, [int individualValue, int effortSpeedValue, PersonalityType personality]) async {
    // 個体値を計算
    int slowestIndividual = individualValue == null ? 0 : individualValue;
    int uncorrectedIndividual = individualValue == null ? 31 : individualValue;
    int fasterIndividual = individualValue == null ? 31 : individualValue;
    int fastestIndividual = individualValue == null ? 31 : individualValue;

    // 努力値を計算
    int slowestEffort = effortSpeedValue == null ? 0 : effortSpeedValue;
    int uncorrectedEffort= effortSpeedValue == null ? 0 : effortSpeedValue;
    int fasterEffort= effortSpeedValue == null ? 252 : effortSpeedValue;
    int fastestEffort= effortSpeedValue == null ? 252 : effortSpeedValue;

    double slowestPersonality;
    double uncorrectedPersonality;
    double fasterPersonality;
    double fastestPersonality;

    // 性格補正を計算
    switch (personality) {
      case PersonalityType.descent:
        slowestPersonality = 0.9;
        uncorrectedPersonality = 0.9;
        fasterPersonality = 0.9;
        fastestPersonality = 0.9;
        break;

      case PersonalityType.uncorrected:
        slowestPersonality = 1;
        uncorrectedPersonality = 1;
        fasterPersonality = 1;
        fastestPersonality = 1;
        break;

      case PersonalityType.rise:
        slowestPersonality = 1.1;
        uncorrectedPersonality = 1.1;
        fasterPersonality = 1.1;
        fastestPersonality = 1.1;
        break;

      default:
        slowestPersonality = 0.9;
        uncorrectedPersonality = 1;
        fasterPersonality = 1;
        fastestPersonality = 1.1;
        break;

    }

    // パラメータを計算
    if (name != "" && name != null) {
      int slowest = await calcSpeed(name, slowestIndividual, slowestEffort, slowestPersonality, correction, scarf, wind, paralisys, weather);
      int uncorrected = await calcSpeed(name, uncorrectedIndividual, uncorrectedEffort, uncorrectedPersonality, correction, scarf, wind, paralisys, weather);
      int faster = await calcSpeed(name, fasterIndividual, fasterEffort, fasterPersonality, correction, scarf, wind, paralisys, weather);
      int fastest = await calcSpeed(name, fastestIndividual, fastestEffort, fastestPersonality, correction, scarf, wind, paralisys, weather);
      state = ResultState(state.opponentSlowest, state.opponentUncorrected, state.opponentFaster, state.opponentFastest, slowest, uncorrected, faster, fastest);
    } else {
      state = ResultState(state.opponentSlowest, state.opponentUncorrected, state.opponentFaster, state.opponentFastest, 0, 0, 0, 0);
    }
  }
}
