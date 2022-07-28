import 'package:watcher_client_dal/models/error_code.dart';

class ProcessingResult<E> {
  late final E errorCode;

  ProcessingResult({ required this.errorCode });
}