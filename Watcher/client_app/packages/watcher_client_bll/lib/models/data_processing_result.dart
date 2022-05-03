import 'package:watcher_client_bll/models/processing_result.dart';

class DataProcessingResult<E, D> extends ProcessingResult<E> {
  late final D Data;

  DataProcessingResult(E e, this.Data) : super(e);
}