import 'package:calc_speed/enum/PersonalityType.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ResultState.freezed.dart';

@freezed
abstract class ResultState with _$ResultState{
  const factory ResultState({
    @Default(0) int opponentSlowest,
    @Default(0) int opponentUncorrected,
    @Default(0) int opponentFaster,
    @Default(0) int opponentFastest,
    @Default(0) int myselfSlowest,
    @Default(0) int myselfUncorrected,
    @Default(0) int myselfFaster,
    @Default(0) int myselfFastest,
  }) = ResultStateData;
}