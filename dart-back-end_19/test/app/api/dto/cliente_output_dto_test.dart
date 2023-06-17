import 'package:dart_back_end_19/app/api/api.dart';
import 'package:dart_back_end_19/app/domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('deve retornar uma lista de ClienteOutputDTO', () async {
    final result = ClienteOutputDTO.toCollectionDTO([
      Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'),
    ]);

    expect(result, isA<List<ClienteOutputDTO>>());
  });
}
