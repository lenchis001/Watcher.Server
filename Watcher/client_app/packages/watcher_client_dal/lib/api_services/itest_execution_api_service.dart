import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/test_execution/test_execution.dart';

abstract class ITestExecutionApiService {
  Future<DefaultDataProcessingResult<List<TestExecution>>> getLatest();
}