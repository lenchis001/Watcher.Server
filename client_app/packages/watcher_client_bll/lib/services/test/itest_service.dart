import 'package:watcher_client_bll/models/test/add_test.dart';
import 'package:watcher_client_bll/models/test/test.dart';
import 'package:watcher_client_bll/services/icrud_service.dart';

abstract class ITestService extends ICrudService<Test, AddTest> {}