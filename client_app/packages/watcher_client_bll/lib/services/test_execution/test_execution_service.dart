import 'package:automap/automap.dart';
import 'package:watcher_client_bll/models/default_data_processing_result.dart';
import 'package:watcher_client_bll/models/test_execution/test_execution.dart';
import 'package:watcher_client_bll/services/test_execution/itest_execution_service.dart';
import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

class TestExecutionService extends ITestExecutionService {
  final wcd.ITestExecutionApiService apiService;
  final AutoMapper mapper;

  TestExecutionService({
    required this.apiService,
    required this.mapper,
  });

  @override
  Future<DefaultDataProcessingResult<List<TestExecution>>> getLatest() async {
    final dalResult = await apiService.getLatest();
    return mapper.map<
        wcd.DefaultDataProcessingResult<List<wcd.TestExecution>>,
        DefaultDataProcessingResult<List<TestExecution>>
    >(dalResult);
  }

}