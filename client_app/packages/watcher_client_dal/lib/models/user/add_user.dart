import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

part 'add_user.freezed.dart';
part 'add_user.g.dart';

@freezed
class AddUser with _$AddUser implements IToJsonAware {
  factory AddUser({
    required String email,
    required String password
  }) = _$DataAddUser;

  factory AddUser.fromJson(Map<String, dynamic> json) => _$AddUserFromJson(json);
}