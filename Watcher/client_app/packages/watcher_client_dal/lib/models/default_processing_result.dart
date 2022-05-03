import 'package:watcher_client_dal/models/processing_result.dart';

import 'error_code.dart';

class DefaultProcessingResult extends ProcessingResult<ErrorCode> {
  DefaultProcessingResult(ErrorCode e) : super(e);

  DefaultProcessingResult.ok(): this(ErrorCode.OK);
}