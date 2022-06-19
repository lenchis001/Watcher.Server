import 'dart:convert';

import 'package:automap/automap.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';
import 'package:watcher_client_dal/models/error_code.dart';
import 'package:watcher_client_dal/models/ito_json_aware.dart';
import 'package:watcher_client_dal/repositories/iauthentication_repository.dart';

import 'icommunication_service.dart';

class CommunicationService extends ICommunicationService {
  final AutoMapper mapper;
  final IAuthenticationRepository authenticationRepository;
  final Dio _client;

  CommunicationService({required this.mapper, required this.authenticationRepository}): _client = Dio();

  @override
  Future<DefaultProcessingResult> makePost<TReq extends IToJsonAware>({
    required Uri uri,
    required TReq data,
    bool tryInsertAuthToken = true,
    bool tryReadAuthToken = false
  }) async {
    final headers = <String, String>{};
    if(tryInsertAuthToken && await authenticationRepository.areAuthenticationDataSaved) {
      headers.addAll(await this.authenticationRepository.pullAuthenticationData());
    }

    final response = await _client.post(uri.toString(),
        data: jsonEncode(data.toJson()),
        options: Options(method: 'POST', contentType: 'application/json', headers: headers));

    if(tryReadAuthToken && response.statusCode == 200) {
      await authenticationRepository.clear();

      // if(response.headers.containsKey('set-cookie')) {
      //   await authenticationRepository.putAuthenticationData(<String, String> {
      //     'cookie': response.headers['set-cookie']!
      //   });
      // }
    }

    return DefaultProcessingResult(
        errorCode: _fromStatusCode(response.statusCode ?? -1));
  }

  @override
  Future<DefaultDataProcessingResult<TRes>> makeGet<TRes>({ required Uri uri, bool tryInsertAuthToken = true }) async {
    final headers = <String, String>{'Content-Type': 'application/json'};

    final response = await _client.get(uri.toString(), options: Options(method: 'GET', headers: headers));

    return DefaultDataProcessingResult<TRes>(
        errorCode: _fromStatusCode(response.statusCode ?? -1),
        data: response.statusCode == 200
            ? mapper.map<dynamic, TRes>(response.data)
            : null);
  }

  ErrorCode _fromStatusCode(int value) {
    switch (value) {
      case 200:
        return ErrorCode.OK;
      case 401:
        return ErrorCode.UNAUTHORIZED;
      default:
        return ErrorCode.UNKNOWN;
    }
  }
}
