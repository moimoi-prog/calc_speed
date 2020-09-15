import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:calc_speed/module/PokemonModule.dart';
import 'package:state_notifier/state_notifier.dart';

import 'ResultState.dart';

// ------------------------------------
// クラス名　: ResultStateNotifier
// クラス概要: 結果表示ComponentNotifier
// ------------------------------------
class ResultStateNotifier extends StateNotifier<ResultState> with LocatorMixin{
  // 初期化
  ResultStateNotifier() : super(ResultStateData());

  // 初期処理
  void initState() {
    super.initState();

    state = ResultState(
      opponentSlowest: 0,
      opponentUncorrected: 0,
      opponentFaster: 0,
      opponentFastest: 0,
      myselfSlowest: 0,
      myselfUncorrected: 0,
      myselfFaster: 0,
      myselfFastest: 0,
    );
  }
  // 相手の値を変更
  void changeOpponent(String name, int correction, bool scarf, bool wind, bool paralisys, bool weather, [int individualValue, int effortSpeedValue, PersonalityType personality]) async {
    final currentState = state;

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
      state = state.copyWith(
        opponentSlowest: slowest,
        opponentUncorrected: uncorrected,
        opponentFaster: faster,
        opponentFastest: fastest,
        myselfSlowest: currentState.myselfSlowest,
        myselfUncorrected: currentState.myselfUncorrected,
        myselfFaster: currentState.myselfFaster,
        myselfFastest: currentState.myselfFastest,
      );
    } else {
      state = state.copyWith(
        opponentSlowest: 0,
        opponentUncorrected: 0,
        opponentFaster: 0,
        opponentFastest: 0,
        myselfSlowest: currentState.myselfSlowest,
        myselfUncorrected: currentState.myselfUncorrected,
        myselfFaster: currentState.myselfFaster,
        myselfFastest: currentState.myselfFastest,
      );
    }
  }

  // 自分の値を変更
  void changeMyself(String name, int correction, bool scarf, bool wind, bool paralisys, bool weather, [int individualValue, int effortSpeedValue, PersonalityType personality]) async {
    final currentState = state;

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
      state = state.copyWith(
        opponentSlowest: currentState.opponentSlowest,
        opponentUncorrected: currentState.opponentUncorrected,
        opponentFaster: currentState.opponentFaster,
        opponentFastest: currentState.opponentFastest,
        myselfSlowest: slowest,
        myselfUncorrected: uncorrected,
        myselfFaster: faster,
        myselfFastest: fastest,
      );
    } else {
      state = state.copyWith(
        opponentSlowest: currentState.opponentSlowest,
        opponentUncorrected: currentState.opponentUncorrected,
        opponentFaster: currentState.opponentFaster,
        opponentFastest: currentState.opponentFastest,
        myselfSlowest: 0,
        myselfUncorrected: 0,
        myselfFaster: 0,
        myselfFastest: 0,
      );
    }
  }
}
