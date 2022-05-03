import 'package:automap/automap.dart';
import 'package:watcher_client_bll/models/default_processing_result.dart';
import 'package:watcher_client_bll/models/error_code.dart';
import 'package:watcher_client_bll/models/user/add_user.dart';
import 'package:watcher_client_bll/models/user/sign_in.dart' as SignInModel;
import 'package:watcher_client_bll/models/user/user.dart';
import 'package:watcher_client_bll/services/crud_service.dart';
import 'package:watcher_client_bll/services/user/iuser_service.dart';
import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

class UserService extends CrudService<User, AddUser, wcd.User, wcd.AddUser, wcd.IUserApiService>
    implements IUserService {
  UserService({
    required wcd.IUserApiService userApiService,
    required AutoMapper mapper
  }) : super(mapper: mapper, apiService: userApiService);

  @override
  Future<DefaultProcessingResult> signIn(SignInModel.SignIn value) async {
    final dalModel = mapper.map<SignInModel.SignIn, wcd.SignIn>(value);

    await apiService.signIn(dalModel);
    return DefaultProcessingResult(ErrorCode.OK);
  }

}