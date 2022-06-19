import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:watcher_client_dal/repositories/iauthentication_repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final FlutterSecureStorage _storage;

  AuthenticationRepository(): _storage = FlutterSecureStorage();

  @override
  Future<bool> get areAuthenticationDataSaved => _storage.readAll().then((value) => value.isNotEmpty);

  @override
  Future<Map<String, String>> pullAuthenticationData() {
    return _storage.readAll();
  }

  @override
  Future putAuthenticationData(Map<String, String> values) {
    final writeFutures = values
        .map((key, value) => MapEntry(key, _storage.write(key: key, value: value)))
        .values
        .toList(growable: false);

    return Future.wait(writeFutures);
  }

  @override
  Future clear() {
    return _storage.deleteAll();
  }
  
}