import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

part 'sign_in.freezed.dart';
part 'sign_in.g.dart';

@freezed
class SignIn with _$SignIn implements IToJsonAware {
  factory SignIn({
    required String email,
    required String password
  }) = _$DataSignIn;

  factory SignIn.fromJson(Map<String, dynamic> data) => _$SignInFromJson(data);
}