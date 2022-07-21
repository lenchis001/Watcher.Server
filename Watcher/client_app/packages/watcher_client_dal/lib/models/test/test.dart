import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

part 'test.freezed.dart';
part 'test.g.dart';

@Freezed(
  copyWith: false,
  fromJson: true,
  toJson: true,
  map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false),
  when: FreezedWhenOptions(when: false, whenOrNull: false, maybeWhen: false),
  makeCollectionsUnmodifiable: false
)
class Test with _$Test implements IToJsonAware {
  factory Test({
    required int id,
    required String name,
    required String script,
    required String cron
  }) = _$DataTest;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}