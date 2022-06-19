export 'package:watcher_client_bll/models/user/sign_in.dart';
export 'package:watcher_client_bll/models/user/add_user.dart';
export 'package:watcher_client_bll/models/user/user.dart';
export 'package:watcher_client_bll/models/default_processing_result.dart';
export 'package:watcher_client_bll/models/default_data_processing_result.dart';
export 'package:watcher_client_bll/models/error_code.dart';
export 'package:watcher_client_bll/models/test/add_test.dart';
export 'package:watcher_client_bll/models/test/test.dart';
export 'package:watcher_client_bll/services/user/iuser_service.dart';
export 'package:watcher_client_bll/services/test/itest_service.dart';

import 'package:automap/automap.dart';
import 'package:get_it/get_it.dart';
import 'package:watcher_client_bll/models/default_data_processing_result.dart';
import 'package:watcher_client_bll/models/default_processing_result.dart';
import 'package:watcher_client_bll/models/error_code.dart';
import 'package:watcher_client_bll/models/test/test.dart';
import 'package:watcher_client_bll/services/test/itest_service.dart';
import 'package:watcher_client_bll/services/test/test_service.dart';
import 'package:watcher_client_bll/services/user/iuser_service.dart';
import 'package:watcher_client_bll/services/user/user_service.dart';
import 'package:watcher_client_bll/models/test/add_test.dart';
import 'package:watcher_client_bll/models/user/add_user.dart';
import 'package:watcher_client_bll/models/user/sign_in.dart';

import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

class Facade {
  static void setupDependencies(GetIt container) {
    wcd.Facade.setupDependencies(container);

    container.registerSingleton<IUserService>(
        UserService(userApiService: container.get(), mapper: container.get()));

    container.registerSingleton<ITestService>(
        TestService(apiService: container.get(), mapper: container.get()));
  }

  static void setupMappings(AutoMapper mapper) {
    wcd.Facade.setupMappings(mapper);

    mapper
      ..addManualMap<SignIn, wcd.SignIn>((source, mapper, params) =>
          wcd.SignIn(email: source.email, password: source.password))
      ..addManualMap<wcd.ErrorCode, ErrorCode>((source, mapper, params) {
        switch (source) {
          case wcd.ErrorCode.OK:
            return ErrorCode.OK;
          case wcd.ErrorCode.UNKNOWN:
            return ErrorCode.UNKNOWN;
          case wcd.ErrorCode.UNAUTHORIZED:
            return ErrorCode.UNAUTHORIZED;
        }
      })
      ..addManualMap<wcd.DefaultProcessingResult, DefaultProcessingResult>(
          (source, mapper, params) => DefaultProcessingResult(
              errorCode:
                  mapper.map<wcd.ErrorCode, ErrorCode>(source.errorCode)))
      ..addManualMap<AddUser, wcd.AddUser>((source, mapper, params) =>
          wcd.AddUser(email: source.email, password: source.password))
      ..addManualMap<wcd.AddTest, AddTest>((source, mapper, params) =>
          AddTest(name: source.name, script: source.script, cron: source.cron))
      ..addManualMap<wcd.Test, Test>((source, mapper, params) => Test(
            id: source.id,
            name: source.name,
            script: source.script,
            cron: source.cron,
          ))
      ..addManualMap<wcd.DefaultDataProcessingResult<List<wcd.Test>>,
              DefaultDataProcessingResult<List<Test>>>(
          (source, mapper, params) => DefaultDataProcessingResult<List<Test>>(
              errorCode: mapper.map<wcd.ErrorCode, ErrorCode>(source.errorCode),
              data: source.data == null
                  ? null
                  : source.data!
                      .map((value) => mapper.map<wcd.Test, Test>(value))
                      .toList()));
  }
}
