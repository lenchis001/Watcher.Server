import 'package:watcher_client_bll/models/default_data_processing_result.dart';
import 'package:watcher_client_bll/models/test_execution/test_execution.dart';

abstract class ITestExecutionService {
  Future<DefaultDataProcessingResult<List<TestExecution>>> getLatest();
}