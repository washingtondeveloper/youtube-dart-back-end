part of infra;

class PostgreSQL implements Connection {
  late PostgreSQLConnection? _connection;
  @override
  Future<void> close() async {
    await _connection?.close();
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String statement, [
    Map<String, dynamic> params = const {},
  ]) async {
    _connection = PostgreSQLConnection(
      ConfigEnv.dbHost,
      int.parse(ConfigEnv.dbPort),
      ConfigEnv.dbDatabaseName,
      username: ConfigEnv.dbUsername,
      password: ConfigEnv.dbPassword,
    );

    await _connection!.open();
    List<Map<String, dynamic>> map = [];

    final rows =
        await _connection!.query(statement, substitutionValues: params);

    for (final row in rows) {
      map.add(row.toColumnMap());
    }

    return map;
  }
}
