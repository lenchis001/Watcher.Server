// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'test_execution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestExecution _$TestExecutionFromJson(Map<String, dynamic> json) {
  return _$DataTest.fromJson(json);
}

/// @nodoc
mixin _$TestExecution {
  int get id => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get log => throw _privateConstructorUsedError;
  bool get isSuccessful => throw _privateConstructorUsedError;
  int get testId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_$DataTest implements _$DataTest {
  _$_$DataTest(
      {required this.id,
      required this.dateTime,
      required this.log,
      required this.isSuccessful,
      required this.testId});

  factory _$_$DataTest.fromJson(Map<String, dynamic> json) =>
      _$$_$DataTestFromJson(json);

  @override
  final int id;
  @override
  final DateTime dateTime;
  @override
  final String log;
  @override
  final bool isSuccessful;
  @override
  final int testId;

  @override
  String toString() {
    return 'TestExecution(id: $id, dateTime: $dateTime, log: $log, isSuccessful: $isSuccessful, testId: $testId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataTest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.log, log) &&
            const DeepCollectionEquality()
                .equals(other.isSuccessful, isSuccessful) &&
            const DeepCollectionEquality().equals(other.testId, testId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(log),
      const DeepCollectionEquality().hash(isSuccessful),
      const DeepCollectionEquality().hash(testId));

  @override
  Map<String, dynamic> toJson() {
    return _$$_$DataTestToJson(this);
  }
}

abstract class _$DataTest implements TestExecution {
  factory _$DataTest(
      {required final int id,
      required final DateTime dateTime,
      required final String log,
      required final bool isSuccessful,
      required final int testId}) = _$_$DataTest;

  factory _$DataTest.fromJson(Map<String, dynamic> json) =
      _$_$DataTest.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  DateTime get dateTime => throw _privateConstructorUsedError;
  @override
  String get log => throw _privateConstructorUsedError;
  @override
  bool get isSuccessful => throw _privateConstructorUsedError;
  @override
  int get testId => throw _privateConstructorUsedError;
}
