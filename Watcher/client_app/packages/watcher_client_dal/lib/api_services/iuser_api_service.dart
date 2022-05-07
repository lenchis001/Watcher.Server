import 'package:watcher_client_dal/api_services/icrud_api_service.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/user/add_user.dart';
import 'package:watcher_client_dal/models/user/sign_in.dart';
import 'package:watcher_client_dal/models/user/user.dart';

abstract class IUserApiService extends ICrudApiService<User, AddUser> {
  Future<DefaultProcessingResult> signIn(SignIn data);
}