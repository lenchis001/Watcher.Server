import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

abstract class ICommunicationService {
  Future<DefaultProcessingResult> makePost<TReq extends IToJsonAware>(Uri uri, TReq data);
  Future<DefaultDataProcessingResult<TRes>> makeGet<TRes>(Uri uri);
}