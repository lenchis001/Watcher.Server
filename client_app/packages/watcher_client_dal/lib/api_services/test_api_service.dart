import 'package:watcher_client_dal/api_services/itest_api_service.dart';
import 'package:watcher_client_dal/api_services/crud_api_service.dart';
import 'package:watcher_client_dal/api_services/icommunication_service.dart';
import 'package:watcher_client_dal/api_services/iuri_building_service.dart';
import 'package:watcher_client_dal/models/test/add_test.dart';
import 'package:watcher_client_dal/models/test/test.dart';

class TestApiService extends CrudApiService<Test, AddTest> implements ITestApiService {
  TestApiService({
    required ICommunicationService communicationService,
    required IUriBuildingService uriBuildingService
  }) : super(
      communicationService: communicationService,
      uri: uriBuildingService.testApiUri
  );
}