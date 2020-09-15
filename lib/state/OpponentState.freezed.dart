// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'OpponentState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$OpponentStateTearOff {
  const _$OpponentStateTearOff();

// ignore: unused_element
  OpponentStateData call(
      {TextEditingController nameController,
      PersonalityType personalityType = PersonalityType.uncorrected,
      TextEditingController individualController,
      TextEditingController effortValueController,
      int correnction = 0,
      bool scarfFlag = false,
      bool tailWindFlag = false,
      bool paralysisFlag = false,
      bool weatherFlag = false}) {
    return OpponentStateData(
      nameController: nameController,
      personalityType: personalityType,
      individualController: individualController,
      effortValueController: effortValueController,
      correnction: correnction,
      scarfFlag: scarfFlag,
      tailWindFlag: tailWindFlag,
      paralysisFlag: paralysisFlag,
      weatherFlag: weatherFlag,
    );
  }
}

// ignore: unused_element
const $OpponentState = _$OpponentStateTearOff();

mixin _$OpponentState {
  TextEditingController get nameController;
  PersonalityType get personalityType;
  TextEditingController get individualController;
  TextEditingController get effortValueController;
  int get correnction;
  bool get scarfFlag;
  bool get tailWindFlag;
  bool get paralysisFlag;
  bool get weatherFlag;

  $OpponentStateCopyWith<OpponentState> get copyWith;
}

abstract class $OpponentStateCopyWith<$Res> {
  factory $OpponentStateCopyWith(
          OpponentState value, $Res Function(OpponentState) then) =
      _$OpponentStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController nameController,
      PersonalityType personalityType,
      TextEditingController individualController,
      TextEditingController effortValueController,
      int correnction,
      bool scarfFlag,
      bool tailWindFlag,
      bool paralysisFlag,
      bool weatherFlag});
}

class _$OpponentStateCopyWithImpl<$Res>
    implements $OpponentStateCopyWith<$Res> {
  _$OpponentStateCopyWithImpl(this._value, this._then);

  final OpponentState _value;
  // ignore: unused_field
  final $Res Function(OpponentState) _then;

  @override
  $Res call({
    Object nameController = freezed,
    Object personalityType = freezed,
    Object individualController = freezed,
    Object effortValueController = freezed,
    Object correnction = freezed,
    Object scarfFlag = freezed,
    Object tailWindFlag = freezed,
    Object paralysisFlag = freezed,
    Object weatherFlag = freezed,
  }) {
    return _then(_value.copyWith(
      nameController: nameController == freezed
          ? _value.nameController
          : nameController as TextEditingController,
      personalityType: personalityType == freezed
          ? _value.personalityType
          : personalityType as PersonalityType,
      individualController: individualController == freezed
          ? _value.individualController
          : individualController as TextEditingController,
      effortValueController: effortValueController == freezed
          ? _value.effortValueController
          : effortValueController as TextEditingController,
      correnction:
          correnction == freezed ? _value.correnction : correnction as int,
      scarfFlag: scarfFlag == freezed ? _value.scarfFlag : scarfFlag as bool,
      tailWindFlag:
          tailWindFlag == freezed ? _value.tailWindFlag : tailWindFlag as bool,
      paralysisFlag: paralysisFlag == freezed
          ? _value.paralysisFlag
          : paralysisFlag as bool,
      weatherFlag:
          weatherFlag == freezed ? _value.weatherFlag : weatherFlag as bool,
    ));
  }
}

abstract class $OpponentStateDataCopyWith<$Res>
    implements $OpponentStateCopyWith<$Res> {
  factory $OpponentStateDataCopyWith(
          OpponentStateData value, $Res Function(OpponentStateData) then) =
      _$OpponentStateDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController nameController,
      PersonalityType personalityType,
      TextEditingController individualController,
      TextEditingController effortValueController,
      int correnction,
      bool scarfFlag,
      bool tailWindFlag,
      bool paralysisFlag,
      bool weatherFlag});
}

class _$OpponentStateDataCopyWithImpl<$Res>
    extends _$OpponentStateCopyWithImpl<$Res>
    implements $OpponentStateDataCopyWith<$Res> {
  _$OpponentStateDataCopyWithImpl(
      OpponentStateData _value, $Res Function(OpponentStateData) _then)
      : super(_value, (v) => _then(v as OpponentStateData));

  @override
  OpponentStateData get _value => super._value as OpponentStateData;

  @override
  $Res call({
    Object nameController = freezed,
    Object personalityType = freezed,
    Object individualController = freezed,
    Object effortValueController = freezed,
    Object correnction = freezed,
    Object scarfFlag = freezed,
    Object tailWindFlag = freezed,
    Object paralysisFlag = freezed,
    Object weatherFlag = freezed,
  }) {
    return _then(OpponentStateData(
      nameController: nameController == freezed
          ? _value.nameController
          : nameController as TextEditingController,
      personalityType: personalityType == freezed
          ? _value.personalityType
          : personalityType as PersonalityType,
      individualController: individualController == freezed
          ? _value.individualController
          : individualController as TextEditingController,
      effortValueController: effortValueController == freezed
          ? _value.effortValueController
          : effortValueController as TextEditingController,
      correnction:
          correnction == freezed ? _value.correnction : correnction as int,
      scarfFlag: scarfFlag == freezed ? _value.scarfFlag : scarfFlag as bool,
      tailWindFlag:
          tailWindFlag == freezed ? _value.tailWindFlag : tailWindFlag as bool,
      paralysisFlag: paralysisFlag == freezed
          ? _value.paralysisFlag
          : paralysisFlag as bool,
      weatherFlag:
          weatherFlag == freezed ? _value.weatherFlag : weatherFlag as bool,
    ));
  }
}

class _$OpponentStateData
    with DiagnosticableTreeMixin
    implements OpponentStateData {
  const _$OpponentStateData(
      {this.nameController,
      this.personalityType = PersonalityType.uncorrected,
      this.individualController,
      this.effortValueController,
      this.correnction = 0,
      this.scarfFlag = false,
      this.tailWindFlag = false,
      this.paralysisFlag = false,
      this.weatherFlag = false})
      : assert(personalityType != null),
        assert(correnction != null),
        assert(scarfFlag != null),
        assert(tailWindFlag != null),
        assert(paralysisFlag != null),
        assert(weatherFlag != null);

  @override
  final TextEditingController nameController;
  @JsonKey(defaultValue: PersonalityType.uncorrected)
  @override
  final PersonalityType personalityType;
  @override
  final TextEditingController individualController;
  @override
  final TextEditingController effortValueController;
  @JsonKey(defaultValue: 0)
  @override
  final int correnction;
  @JsonKey(defaultValue: false)
  @override
  final bool scarfFlag;
  @JsonKey(defaultValue: false)
  @override
  final bool tailWindFlag;
  @JsonKey(defaultValue: false)
  @override
  final bool paralysisFlag;
  @JsonKey(defaultValue: false)
  @override
  final bool weatherFlag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OpponentState(nameController: $nameController, personalityType: $personalityType, individualController: $individualController, effortValueController: $effortValueController, correnction: $correnction, scarfFlag: $scarfFlag, tailWindFlag: $tailWindFlag, paralysisFlag: $paralysisFlag, weatherFlag: $weatherFlag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OpponentState'))
      ..add(DiagnosticsProperty('nameController', nameController))
      ..add(DiagnosticsProperty('personalityType', personalityType))
      ..add(DiagnosticsProperty('individualController', individualController))
      ..add(DiagnosticsProperty('effortValueController', effortValueController))
      ..add(DiagnosticsProperty('correnction', correnction))
      ..add(DiagnosticsProperty('scarfFlag', scarfFlag))
      ..add(DiagnosticsProperty('tailWindFlag', tailWindFlag))
      ..add(DiagnosticsProperty('paralysisFlag', paralysisFlag))
      ..add(DiagnosticsProperty('weatherFlag', weatherFlag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OpponentStateData &&
            (identical(other.nameController, nameController) ||
                const DeepCollectionEquality()
                    .equals(other.nameController, nameController)) &&
            (identical(other.personalityType, personalityType) ||
                const DeepCollectionEquality()
                    .equals(other.personalityType, personalityType)) &&
            (identical(other.individualController, individualController) ||
                const DeepCollectionEquality().equals(
                    other.individualController, individualController)) &&
            (identical(other.effortValueController, effortValueController) ||
                const DeepCollectionEquality().equals(
                    other.effortValueController, effortValueController)) &&
            (identical(other.correnction, correnction) ||
                const DeepCollectionEquality()
                    .equals(other.correnction, correnction)) &&
            (identical(other.scarfFlag, scarfFlag) ||
                const DeepCollectionEquality()
                    .equals(other.scarfFlag, scarfFlag)) &&
            (identical(other.tailWindFlag, tailWindFlag) ||
                const DeepCollectionEquality()
                    .equals(other.tailWindFlag, tailWindFlag)) &&
            (identical(other.paralysisFlag, paralysisFlag) ||
                const DeepCollectionEquality()
                    .equals(other.paralysisFlag, paralysisFlag)) &&
            (identical(other.weatherFlag, weatherFlag) ||
                const DeepCollectionEquality()
                    .equals(other.weatherFlag, weatherFlag)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nameController) ^
      const DeepCollectionEquality().hash(personalityType) ^
      const DeepCollectionEquality().hash(individualController) ^
      const DeepCollectionEquality().hash(effortValueController) ^
      const DeepCollectionEquality().hash(correnction) ^
      const DeepCollectionEquality().hash(scarfFlag) ^
      const DeepCollectionEquality().hash(tailWindFlag) ^
      const DeepCollectionEquality().hash(paralysisFlag) ^
      const DeepCollectionEquality().hash(weatherFlag);

  @override
  $OpponentStateDataCopyWith<OpponentStateData> get copyWith =>
      _$OpponentStateDataCopyWithImpl<OpponentStateData>(this, _$identity);
}

abstract class OpponentStateData implements OpponentState {
  const factory OpponentStateData(
      {TextEditingController nameController,
      PersonalityType personalityType,
      TextEditingController individualController,
      TextEditingController effortValueController,
      int correnction,
      bool scarfFlag,
      bool tailWindFlag,
      bool paralysisFlag,
      bool weatherFlag}) = _$OpponentStateData;

  @override
  TextEditingController get nameController;
  @override
  PersonalityType get personalityType;
  @override
  TextEditingController get individualController;
  @override
  TextEditingController get effortValueController;
  @override
  int get correnction;
  @override
  bool get scarfFlag;
  @override
  bool get tailWindFlag;
  @override
  bool get paralysisFlag;
  @override
  bool get weatherFlag;
  @override
  $OpponentStateDataCopyWith<OpponentStateData> get copyWith;
}
