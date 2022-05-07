import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

part 'add_test.freezed.dart';
part 'add_test.g.dart';

@freezed
class AddTest with _$AddTest implements IToJsonAware {
  factory AddTest({
    required String name,
    required String script,
    required String cron
  }) = _$DataAddTest;

  factory AddTest.fromJson(Map<String, dynamic> json) => _$AddTestFromJson(json);
}