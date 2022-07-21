import 'package:automap/automap.dart';
import 'package:watcher_client_bll/models/test/add_test.dart';
import 'package:watcher_client_bll/models/test/test.dart';
import 'package:watcher_client_bll/services/crud_service.dart';
import 'package:watcher_client_bll/services/test/itest_service.dart';
import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

class TestService extends CrudService<Test, AddTest, wcd.Test, wcd.AddTest, wcd.ITestApiService> implements ITestService {
  TestService({
    required wcd.ITestApiService apiService,
    required AutoMapper mapper,
  }): super(apiService: apiService, mapper: mapper);
}