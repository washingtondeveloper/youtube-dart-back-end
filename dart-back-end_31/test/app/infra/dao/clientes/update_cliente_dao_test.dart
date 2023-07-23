import 'dart:async';

import 'package:dart_back_end_31/app/domain/domain.dart';
import 'package:dart_back_end_31/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late UpdateClienteDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = UpdateClienteDAO(mockConnection);
  });
  group('UpdateClienteDAO:', () {
    test('deve atualizar um cliente', () async {
      when(() => mockConnection.close())
          .thenAnswer((_) async => Completer().complete());
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 1,
              'nome': 'nome test',
              'email': 'email@email.com',
              'telefone': '1111-1111'
            }
          ]);
      final result = await dao.call(clienteMock);

      expect(result, isA<Cliente>());
    });
  });
}
