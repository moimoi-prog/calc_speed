import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';

part 'OpponentState.freezed.dart';

// ------------------------------------
// クラス名　: OpponentState
// クラス概要: 相手ComponentState
// ------------------------------------
@freezed
abstract class OpponentState with _$OpponentState {
  const factory OpponentState({
    TextEditingController nameController,
    @Default(PersonalityType.uncorrected) PersonalityType personalityType,
    TextEditingController individualController,
    TextEditingController effortValueController,
    @Default(0) int correnction,
    @Default(false) bool scarfFlag,
    @Default(false) bool tailWindFlag,
    @Default(false) bool paralysisFlag,
    @Default(false) bool weatherFlag,
  }) = OpponentStateData;
}
