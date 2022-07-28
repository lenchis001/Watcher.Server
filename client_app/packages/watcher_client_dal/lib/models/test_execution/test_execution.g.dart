// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_execution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_$DataTest _$$_$DataTestFromJson(Map<String, dynamic> json) => _$_$DataTest(
      id: json['id'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      log: json['log'] as String,
      isSuccessful: json['isSuccessful'] as bool,
      testId: json['testId'] as int,
    );

Map<String, dynamic> _$$_$DataTestToJson(_$_$DataTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime.toIso8601String(),
      'log': instance.log,
      'isSuccessful': instance.isSuccessful,
      'testId': instance.testId,
    };
