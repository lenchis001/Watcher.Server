import 'dart:convert';

import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:http/http.dart' as http;
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/error_code.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';

import 'icommunication_service.dart';

class CommunicationService extends ICommunicationService {
  @override
  Future<DefaultProcessingResult> makePost<TReq extends IToJsonAware>(Uri uri, TReq data) async {
   final response = await http.post(
        uri,
        body: jsonEncode(data.toJson()),
        headers: <String, String>
        {
          'Content-Type': 'application/json'
        });

    return DefaultProcessingResult(errorCode: _fromStatusCode(response.statusCode));
  }

  @override
  Future<DefaultDataProcessingResult<TRes>> makeGet<TRes>(Uri uri) {
    // TODO: implement makeGet
    throw UnimplementedError();
  }

  ErrorCode _fromStatusCode(int value) {
    switch (value){
      case 200:
        return ErrorCode.OK;
      case 401:
        return ErrorCode.UNAUTHORIZED;
      default:
        return ErrorCode.UNKNOWN;
    }
  }
}