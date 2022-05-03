import 'package:watcher_client_dal/api_services/icommunication_service.dart';
import 'package:watcher_client_dal/api_services/icrud_api_service.dart';
import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

class CrudApiService<T extends IToJsonAware, AT extends IToJsonAware> extends ICrudApiService<T, AT> {
  final ICommunicationService communicationService;
  final Uri uri;

  CrudApiService({
    required this.communicationService,
    required this.uri
  });

  @override
  Future<DefaultProcessingResult> add(AT value) {
    return communicationService.makePost(uri, value);
  }

  @override
  Future<DefaultProcessingResult> delete(int id) {
    throw Error();
    //return communicationService.makeDelete(uri, value);
  }

  @override
  Future<DefaultDataProcessingResult<List<T>>> getAll() {
    return communicationService.makeGet(uri);
  }

  @override
  Future<DefaultProcessingResult> update(T value) {
    throw Error();
    //return communicationService.makePut(uri, value);
  }
}