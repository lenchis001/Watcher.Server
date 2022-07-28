// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Test _$TestFromJson(Map<String, dynamic> json) {
  return _$DataTest.fromJson(json);
}

/// @nodoc
mixin _$Test {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get script => throw _privateConstructorUsedError;
  String get cron => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_$DataTest implements _$DataTest {
  _$_$DataTest(
      {required this.id,
      required this.name,
      required this.script,
      required this.cron});

  factory _$_$DataTest.fromJson(Map<String, dynamic> json) =>
      _$$_$DataTestFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String script;
  @override
  final String cron;

  @override
  String toString() {
    return 'Test(id: $id, name: $name, script: $script, cron: $cron)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataTest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.script, script) &&
            const DeepCollectionEquality().equals(other.cron, cron));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(script),
      const DeepCollectionEquality().hash(cron));

  @override
  Map<String, dynamic> toJson() {
    return _$$_$DataTestToJson(this);
  }
}

abstract class _$DataTest implements Test {
  factory _$DataTest(
      {required final int id,
      required final String name,
      required final String script,
      required final String cron}) = _$_$DataTest;

  factory _$DataTest.fromJson(Map<String, dynamic> json) =
      _$_$DataTest.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get script => throw _privateConstructorUsedError;
  @override
  String get cron => throw _privateConstructorUsedError;
}
