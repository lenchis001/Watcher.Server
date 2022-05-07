import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements IToJsonAware {
  factory User({
    required String email,
    required String password
  }) = _$DataUser;

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
}