import 'package:watcher_client_dal/api_services/crud_api_service.dart';
import 'package:watcher_client_dal/api_services/icommunication_service.dart';
import 'package:watcher_client_dal/api_services/iuri_building_service.dart';
import 'package:watcher_client_dal/api_services/iuser_api_service.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/user/add_user.dart';
import 'package:watcher_client_dal/models/user/sign_in.dart';
import 'package:watcher_client_dal/models/user/user.dart';

class UserApiService extends CrudApiService<User, AddUser>
    implements IUserApiService {
  final Uri _signInUri;

  UserApiService(
      {required IUriBuildingService uriBuildingService,
      required ICommunicationService communicationService})
      : _signInUri = uriBuildingService.userApiSignInUri,
        super(
            communicationService: communicationService,
            uri: uriBuildingService.userApiUri);

  @override
  Future<DefaultProcessingResult> signIn(SignIn data) {
    return this
        .communicationService
        .makePost<SignIn>(uri: _signInUri, data: data);
  }
}
