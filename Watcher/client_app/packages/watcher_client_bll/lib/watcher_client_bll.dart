export 'models/user/sign_in.dart';
export 'models/user/add_user.dart';
export 'models/user/user.dart';
export 'models/default_processing_result.dart';
export 'models/error_code.dart';
export 'package:watcher_client_bll/services/user/iuser_service.dart';

import 'package:automap/automap.dart';
import 'package:get_it/get_it.dart';
import 'package:watcher_client_bll/models/default_processing_result.dart';
import 'package:watcher_client_bll/models/error_code.dart';
import 'package:watcher_client_bll/services/user/iuser_service.dart';
import 'package:watcher_client_bll/services/user/user_service.dart';
import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

import 'models/user/add_user.dart';
import 'models/user/sign_in.dart';

class Facade {
  static void setupDependencies(GetIt container) {
    wcd.Facade.setupDependencies(container);

    container.registerSingleton<IUserService>(UserService(
        userApiService: container.get(),
        mapper: container.get()
    ));
  }

  static void setupMappings(AutoMapper mapper) {
    mapper
      ..addManualMap<SignIn, wcd.SignIn>((source, mapper, params) =>
          wcd.SignIn(email: source.Email, password: source.Password))
      ..addManualMap<wcd.ErrorCode, ErrorCode>((source, mapper, params) {
          switch(source) {
            case wcd.ErrorCode.OK:
              return ErrorCode.OK;
            case wcd.ErrorCode.UNKNOWN:
              return ErrorCode.UNKNOWN;
            case wcd.ErrorCode.UNAUTHORIZED:
              return ErrorCode.UNAUTHORIZED;
          }
      })
      ..addManualMap<wcd.DefaultProcessingResult, DefaultProcessingResult>((source, mapper, params) =>
          DefaultProcessingResult(errorCode: mapper.map<wcd.ErrorCode, ErrorCode>(source.errorCode)))
      ..addManualMap<AddUser, wcd.AddUser>((source, mapper, params) =>
          wcd.AddUser(email: source.Email, password: source.Password));

    wcd.Facade.setupMappings(mapper);
  }
}