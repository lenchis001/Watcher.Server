// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTest _$AddTestFromJson(Map<String, dynamic> json) {
  return _$DataAddTest.fromJson(json);
}

/// @nodoc
mixin _$AddTest {
  String get name => throw _privateConstructorUsedError;
  String get script => throw _privateConstructorUsedError;
  String get cron => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTestCopyWith<AddTest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTestCopyWith<$Res> {
  factory $AddTestCopyWith(AddTest value, $Res Function(AddTest) then) =
      _$AddTestCopyWithImpl<$Res>;
  $Res call({String name, String script, String cron});
}

/// @nodoc
class _$AddTestCopyWithImpl<$Res> implements $AddTestCopyWith<$Res> {
  _$AddTestCopyWithImpl(this._value, this._then);

  final AddTest _value;
  // ignore: unused_field
  final $Res Function(AddTest) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? script = freezed,
    Object? cron = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      script: script == freezed
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      cron: cron == freezed
          ? _value.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$DataAddTestCopyWith<$Res> implements $AddTestCopyWith<$Res> {
  factory _$$DataAddTestCopyWith(
          _$DataAddTest value, $Res Function(_$DataAddTest) then) =
      __$$DataAddTestCopyWithImpl<$Res>;
  @override
  $Res call({String name, String script, String cron});
}

/// @nodoc
class __$$DataAddTestCopyWithImpl<$Res> extends _$AddTestCopyWithImpl<$Res>
    implements _$$DataAddTestCopyWith<$Res> {
  __$$DataAddTestCopyWithImpl(
      _$DataAddTest _value, $Res Function(_$DataAddTest) _then)
      : super(_value, (v) => _then(v as _$DataAddTest));

  @override
  _$DataAddTest get _value => super._value as _$DataAddTest;

  @override
  $Res call({
    Object? name = freezed,
    Object? script = freezed,
    Object? cron = freezed,
  }) {
    return _then(_$DataAddTest(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      script: script == freezed
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      cron: cron == freezed
          ? _value.cron
          : cron // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_$DataAddTest implements _$DataAddTest {
  _$_$DataAddTest(
      {required this.name, required this.script, required this.cron});

  factory _$_$DataAddTest.fromJson(Map<String, dynamic> json) =>
      _$$_$DataAddTestFromJson(json);

  @override
  final String name;
  @override
  final String script;
  @override
  final String cron;

  @override
  String toString() {
    return 'AddTest(name: $name, script: $script, cron: $cron)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataAddTest &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.script, script) &&
            const DeepCollectionEquality().equals(other.cron, cron));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(script),
      const DeepCollectionEquality().hash(cron));

  @JsonKey(ignore: true)
  @override
  _$$DataAddTestCopyWith<_$DataAddTest> get copyWith =>
      __$$DataAddTestCopyWithImpl<_$DataAddTest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_$DataAddTestToJson(this);
  }
}

abstract class _$DataAddTest implements AddTest {
  factory _$DataAddTest(
      {required final String name,
      required final String script,
      required final String cron}) = _$_$DataAddTest;

  factory _$DataAddTest.fromJson(Map<String, dynamic> json) =
      _$_$DataAddTest.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get script => throw _privateConstructorUsedError;
  @override
  String get cron => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$DataAddTestCopyWith<_$DataAddTest> get copyWith =>
      throw _privateConstructorUsedError;
}
