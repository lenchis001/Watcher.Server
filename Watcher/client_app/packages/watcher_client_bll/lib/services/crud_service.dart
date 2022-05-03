import 'package:automap/automap.dart';
import 'package:watcher_client_bll/models/default_data_processing_result.dart';
import 'package:watcher_client_bll/models/default_processing_result.dart';
import 'package:watcher_client_bll/services/icrud_service.dart';
import 'package:watcher_client_dal/watcher_client_dal.dart' as wcd;

class CrudService<T,AT, API_T, API_AT, API_SERVICE extends wcd.ICrudApiService<API_T, API_AT>>
    implements ICrudService<T,AT> {
  final AutoMapper mapper;
  final API_SERVICE apiService;

  CrudService({
    required this.mapper,
    required this.apiService
  });

  @override
  Future<DefaultProcessingResult> add(AT value) async {
    final dalValue = mapper.map<AT, API_AT>(value);
    final dalResult = await apiService.add(dalValue);
    return mapper.map<wcd.DefaultProcessingResult, DefaultProcessingResult>(dalResult);
  }

  @override
  Future<DefaultProcessingResult> delete(int id) async {
    final dalResult = await apiService.delete(id);
    return mapper.map<wcd.DefaultProcessingResult, DefaultProcessingResult>(dalResult);
  }

  @override
  Future<DefaultDataProcessingResult<List<T>>> getAll() async {
    final dalResult = await apiService.getAll();
    return mapper.map<wcd.DefaultDataProcessingResult<List<API_T>>, DefaultDataProcessingResult<List<T>>>(dalResult);
  }

  @override
  Future<DefaultProcessingResult> update(T value) async {
    final dalValue = mapper.map<T, API_T>(value);
    final dalResult = await apiService.update(dalValue);
    return mapper.map<wcd.DefaultProcessingResult, DefaultProcessingResult>(dalResult);
  }
}