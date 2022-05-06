import 'package:watcher_client_dal/api_services/iuri_building_service.dart';

class UriBuildingService extends IUriBuildingService {
  String _baseUri = 'http://localhost:8092/api/v1';

  Uri get userApiUri => Uri.parse('$_baseUri/user');

  @override
  Uri get userApiSignInUri => userApiUri.resolve('/${userApiUri.pathSegments.join('/')}/signIn');
}