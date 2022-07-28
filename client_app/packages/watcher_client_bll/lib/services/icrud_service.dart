import 'package:watcher_client_bll/models/default_data_processing_result.dart';
import 'package:watcher_client_bll/models/default_processing_result.dart';

abstract class ICrudService<T, AT> {
  Future<DefaultProcessingResult> add(AT value);
  Future<DefaultProcessingResult> update(T value);
  Future<DefaultProcessingResult> delete(int id);
  Future<DefaultDataProcessingResult<List<T>>> getAll();
}