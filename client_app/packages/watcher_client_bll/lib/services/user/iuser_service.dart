import 'package:watcher_client_bll/models/default_processing_result.dart';
import 'package:watcher_client_bll/models/user/add_user.dart';
import 'package:watcher_client_bll/models/user/sign_in.dart' as SignInModel;
import 'package:watcher_client_bll/models/user/user.dart';
import 'package:watcher_client_bll/services/icrud_service.dart';

abstract class IUserService implements ICrudService<User, AddUser> {
  Future<DefaultProcessingResult> signIn(SignInModel.SignIn value);
}