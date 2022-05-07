export 'models/user/sign_in.dart';
export 'models/user/add_user.dart';
export 'models/user/user.dart';
export 'models/test/test.dart';
export 'models/test/add_test.dart';
export 'models/default_processing_result.dart';
export 'models/default_data_processing_result.dart';
export 'models/error_code.dart';

export 'api_services/icrud_api_service.dart';
export 'api_services/iuser_api_service.dart';
export 'api_services/itest_api_service.dart';

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

class Facade {
  static void setupDependencies(GetIt container) {
    container.registerSingleton<ICommunicationService>(CommunicationService());
    container.registerSingleton<IUriBuildingService>(UriBuildingService());

    container.registerSingleton<IUserApiService>(UserApiService(
        uriBuildingService: container.get(),
        communicationService: container.get())
    );

    container.registerSingleton<ITestApiService>(TestApiService(
        communicationService: container.get(),
        uriBuildingService: container.get())
    );
  }

  static void setupMappings(AutoMapper mapper) {

  }
}