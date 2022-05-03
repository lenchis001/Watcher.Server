import 'dart:convert';

import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:http/http.dart' as http;
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

import 'icommunication_service.dart';

class CommunicationService extends ICommunicationService {
  @override
  Future<DefaultProcessingResult> makePost<TReq extends IToJsonAware>(Uri uri, TReq data) async {
    await http.post(
        uri,
        body: jsonEncode(data.toJson()),
        headers: <String, String>
        {
          'Content-Type': 'application/json'
        });
    return DefaultProcessingResult.ok();
  }

  @override
  Future<DefaultDataProcessingResult<TRes>> makeGet<TRes>(Uri uri) {
    // TODO: implement makeGet
    throw UnimplementedError();
  }
}