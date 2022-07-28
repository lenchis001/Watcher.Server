import 'package:watcher_client_dal/models/default_data_processing_result.dart';
import 'package:watcher_client_dal/models/default_processing_result.dart';

abstract class ICrudApiService<T, AT> {
  Future<DefaultProcessingResult> add(AT value);
  Future<DefaultProcessingResult> update(T value);
  Future<DefaultProcessingResult> delete(int id);
  Future<DefaultDataProcessingResult<List<T>>> getAll();
}