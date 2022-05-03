import 'package:watcher_client_dal/models/data_processing_result.dart';

import 'error_code.dart';

class DefaultDataProcessingResult<D> extends DataProcessingResult<ErrorCode, D> {
  DefaultDataProcessingResult(ErrorCode e, D d) : super(e, d);
}