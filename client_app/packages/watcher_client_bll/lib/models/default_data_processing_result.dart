import 'package:watcher_client_bll/models/data_processing_result.dart';

import 'error_code.dart';

class DefaultDataProcessingResult<D> extends DataProcessingResult<ErrorCode, D> {
  DefaultDataProcessingResult({
    required ErrorCode errorCode,
    D? data
  }) : super(errorCode: errorCode, data: data);
}