part of infra;

abstract class Connection {
  Future<List<Map<String, dynamic>>> query(
    String statement, [
    Map<String, dynamic> params = const {},
  ]);
  Future<void> close();
}
