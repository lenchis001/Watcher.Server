import 'package:watcher_client_bll/models/processing_result.dart';

import 'error_code.dart';

class DefaultProcessingResult extends ProcessingResult<ErrorCode> {
  DefaultProcessingResult({ required ErrorCode errorCode }) : super(errorCode: errorCode);

  DefaultProcessingResult.ok(): this(errorCode: ErrorCode.OK);
}