import 'package:watcher_client_bll/models/processing_result.dart';

class DataProcessingResult<E, D> extends ProcessingResult<E> {
  late final D data;

  DataProcessingResult({
    required E errorCode,
    required this.data
  }) : super(errorCode: errorCode);
}