abstract class IAuthenticationRepository {
  Future clear();
  Future putAuthenticationData(Map<String, String> values);
  Future<Map<String, String>> pullAuthenticationData();

  Future<bool> get areAuthenticationDataSaved;
}