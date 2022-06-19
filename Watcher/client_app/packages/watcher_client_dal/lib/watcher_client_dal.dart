export 'package:watcher_client_dal/models/user/sign_in.dart';
export 'package:watcher_client_dal/models/user/add_user.dart';
export 'package:watcher_client_dal/models/user/user.dart';
export 'package:watcher_client_dal/models/test/test.dart';
export 'package:watcher_client_dal/models/test/add_test.dart';
export 'package:watcher_client_dal/models/default_processing_result.dart';
export 'package:watcher_client_dal/models/default_data_processing_result.dart';
export 'package:watcher_client_dal/models/error_code.dart';

export 'package:watcher_client_dal/api_services/icrud_api_service.dart';
export 'package:watcher_client_dal/api_services/iuser_api_service.dart';
export 'package:watcher_client_dal/api_services/itest_api_service.dart';

import 'package:automap/automap.dart';
import 'package:get_it/get_it.dart';
import 'package:watcher_client_dal/api_services/itest_api_service.dart';
import 'package:watcher_client_dal/api_services/communication_api_service.dart';
import 'package:watcher_client_dal/api_services/icommunication_service.dart';
import 'package:watcher_client_dal/api_services/iuri_building_service.dart';
import 'package:watcher_client_dal/api_services/iuser_api_service.dart';
import 'package:watcher_client_dal/api_services/test_api_service.dart';
import 'package:watcher_client_dal/api_services/uri_building_api_service.dart';
import 'package:watcher_client_dal/api_services/user_api_service.dart';
import 'package:watcher_client_dal/repositories/iauthentication_repository.dart';
import 'package:watcher_client_dal/repositories/authentication_repository.dart';

import 'models/test/test.dart';

class Facade {
  static void setupDependencies(GetIt container) {
    container.registerLazySingleton<ICommunicationService>(() => CommunicationService(mapper: container.get(), authenticationRepository: container.get()));
    container.registerLazySingleton<IUriBuildingService>(() => UriBuildingService());

    container.registerLazySingleton<IUserApiService>(() => UserApiService(
        uriBuildingService: container.get(),
        communicationService: container.get())
    );

    container.registerLazySingleton<ITestApiService>(() => TestApiService(
        communicationService: container.get(),
        uriBuildingService: container.get())
    );

    container.registerLazySingleton<IAuthenticationRepository>(() => AuthenticationRepository());
  }

  static void setupMappings(AutoMapper mapper) {
    mapper
      ..addManualMap<dynamic, List<Test>>((source, mapper, params)
      {
        if(source is List) {
          return source.map((e) {
            return Test.fromJson(e);
          }).toList(growable: false);
        }

        throw Exception('List<dynamic> expected but gut ${source.runtimeType}');
      });
  }
}