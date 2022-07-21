import 'package:freezed_annotation/freezed_annotation.dart';
import '../ito_json_aware.dart';

part 'test_execution.freezed.dart';
part 'test_execution.g.dart';

@Freezed(
    copyWith: false,
    fromJson: true,
    toJson: true,
    map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
    when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
    makeCollectionsUnmodifiable: false
)
class TestExecution with _$TestExecution implements IToJsonAware {
  factory TestExecution({
    required int id,
    required DateTime dateTime,
    required String log,
    required bool isSuccessful,
    required int testId
  }) = _$DataTest;

  factory TestExecution.fromJson(Map<String, dynamic> json) => _$TestExecutionFromJson(json);
}