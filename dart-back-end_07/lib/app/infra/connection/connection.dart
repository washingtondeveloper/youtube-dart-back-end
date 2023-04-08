part of infra;

abstract class Connection {
  Future<List<Map<String, dynamic>>> query(String statement);
  Future<void> close();
}
