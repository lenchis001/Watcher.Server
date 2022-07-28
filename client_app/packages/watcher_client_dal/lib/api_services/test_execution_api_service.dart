import 'package:watcher_client_dal/api_services/itest_execution_api_service.dart';
import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/test_execution/test_execution.dart';

import 'icommunication_service.dart';
import 'iuri_building_service.dart';

class TestExecutionApiService extends ITestExecutionApiService {
  final ICommunicationService communicationService;
  final IUriBuildingService uriBuildingService;

  TestExecutionApiService({
    required this.communicationService,
    required this.uriBuildingService
  });

  @override
  Future<DefaultDataProcessingResult<List<TestExecution>>> getLatest() async {
    return this.communicationService.makeGet(uri: uriBuildingService.testExecutionLatestApiUri);
  }

}