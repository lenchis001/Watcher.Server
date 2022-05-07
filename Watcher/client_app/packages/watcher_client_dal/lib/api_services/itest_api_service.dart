import 'package:watcher_client_dal/api_services/icrud_api_service.dart';
import 'package:watcher_client_dal/models/test/add_test.dart';
import 'package:watcher_client_dal/models/test/test.dart';

abstract class ITestApiService extends ICrudApiService<Test, AddTest> {}