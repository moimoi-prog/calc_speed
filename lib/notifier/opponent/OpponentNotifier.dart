import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

import 'OpponentState.dart';
// ------------------------------------
// クラス名　: OpponentStateNotifier
// クラス概要: 相手ComponentNotifier
// ------------------------------------
class OpponentStateNotifier extends StateNotifier<OpponentState> with LocatorMixin {
  // 初期化
  OpponentStateNotifier() : super(OpponentStateData());

  // 初期処理
  void initState() {
    super.initState();

    state = OpponentState(
      nameController: TextEditingController(text: ""),
      personalityType: PersonalityType.uncorrected,
      individualController: TextEditingController(text: "31"),
      effortValueController: TextEditingController(text: "252"),
      correnction: 0,
      scarfFlag: false,
      tailWindFlag: false,
      paralysisFlag: false,
      weatherFlag: false,
    );
  }

  // データ作成
  void create(String name, int effort) {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: TextEditingController(text: name),
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: TextEditingController(text: effort.toString()),
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 名前変更
  void setName(String name) {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: TextEditingController(text: name),
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 性格変更
  void setPersonalityType(PersonalityType personalityType) {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 個体値変更
  void setIndividual(int individual) {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: TextEditingController(text: individual.toString()),
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 努力値変更
  void setEffort(int effortSpeedValue) {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: TextEditingController(text: effortSpeedValue.toString()),
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 努力値変更
  void addEffort(int effort) {
    // 現在のstateを取得
    final currentState = state;

    // 変更後の努力値を計算
    int effortValue = int.parse(currentState.effortValueController.text == "" || currentState.effortValueController.text == null ? "0" : currentState.effortValueController.text);

    if (effortValue < 252) {
      effortValue += effort;

      if (effortValue > 252) {
        effortValue = 252;
      }

      // stateを更新
      state = currentState.copyWith(
        nameController: currentState.nameController,
        personalityType: currentState.personalityType,
        individualController: currentState.individualController,
        effortValueController: TextEditingController(text: effortValue.toString()),
        correnction: currentState.correnction,
        scarfFlag: currentState.scarfFlag,
        tailWindFlag: currentState.tailWindFlag,
        paralysisFlag: currentState.paralysisFlag,
        weatherFlag: currentState.weatherFlag,
      );

    }
  }

  // 努力値減算
  void removeEffort(int effort) {
    // 現在のstateを取得
    final currentState = state;

    // 変更後の努力値を計算
    int effortValue = int.parse(currentState.effortValueController.text == "" || currentState.effortValueController.text == null ? "0" : currentState.effortValueController.text);

    if (effortValue > 0) {
      effortValue -= effort;

      if (effortValue < 0) {
        effortValue = 0;
      }

      // stateを更新
      state = currentState.copyWith(
        nameController: currentState.nameController,
        personalityType: currentState.personalityType,
        individualController: currentState.individualController,
        effortValueController: TextEditingController(text: effortValue.toString()),
        correnction: currentState.correnction,
        scarfFlag: currentState.scarfFlag,
        tailWindFlag: currentState.tailWindFlag,
        paralysisFlag: currentState.paralysisFlag,
        weatherFlag: currentState.weatherFlag,
      );

    }
  }

  // 補正加算
  void addCorrection() {
    if (state.correnction < 6) {
      // 現在のstateを取得
      final currentState = state;

      // stateを更新
      state = currentState.copyWith(
        nameController: currentState.nameController,
        personalityType: currentState.personalityType,
        individualController: currentState.individualController,
        effortValueController: currentState.effortValueController,
        correnction: currentState.correnction + 1,
        scarfFlag: currentState.scarfFlag,
        tailWindFlag: currentState.tailWindFlag,
        paralysisFlag: currentState.paralysisFlag,
        weatherFlag: currentState.weatherFlag,
      );
    }
  }

  // 補正減算
  void removeCorrection() {
    if (state.correnction > -6) {
      // 現在のstateを取得
      final currentState = state;

      // stateを更新
      state = currentState.copyWith(
        nameController: currentState.nameController,
        personalityType: currentState.personalityType,
        individualController: currentState.individualController,
        effortValueController: currentState.effortValueController,
        correnction: currentState.correnction - 1,
        scarfFlag: currentState.scarfFlag,
        tailWindFlag: currentState.tailWindFlag,
        paralysisFlag: currentState.paralysisFlag,
        weatherFlag: currentState.weatherFlag,
      );    }
  }

  // スカーフ判定変更
  changeScarf() {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: !currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 追い風判定変更
  void changeTail() {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: !currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );    }

  // 麻痺判定変更
  void changeParalysys() {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: !currentState.paralysisFlag,
      weatherFlag: currentState.weatherFlag,
    );
  }

  // 天候判定変更
  void changeWeather() {
    // 現在のstateを取得
    final currentState = state;

    // stateを更新
    state = currentState.copyWith(
      nameController: currentState.nameController,
      personalityType: currentState.personalityType,
      individualController: currentState.individualController,
      effortValueController: currentState.effortValueController,
      correnction: currentState.correnction,
      scarfFlag: currentState.scarfFlag,
      tailWindFlag: currentState.tailWindFlag,
      paralysisFlag: currentState.paralysisFlag,
      weatherFlag: !currentState.weatherFlag,
    );
  }
}