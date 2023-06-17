part of infra;

class FakeDB implements Connection {
  @override
  Future<void> close() async {
    print('close connection');
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String statement, [
    Map<String, dynamic> params = const {},
  ]) async {
    return [
      {
        'id': 1,
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '(011) 11111-11111'
      }
    ];
  }
}
