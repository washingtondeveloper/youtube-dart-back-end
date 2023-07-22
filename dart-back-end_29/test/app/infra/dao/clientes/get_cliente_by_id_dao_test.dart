import 'dart:async';

import 'package:dart_back_end_29/app/domain/domain.dart';
import 'package:dart_back_end_29/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClienteByIdDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = GetClienteByIdDAO(mockConnection);
  });

  setUp(() {
    when(() => mockConnection.close())
        .thenAnswer((_) async => Completer<void>().complete());
  });

  group('GetClienteByIdDAO:', () {
    test('deve retornar um cliente', () async {
      when(() => mockConnection.query(any(), any())).thenAnswer((_) async => [
            {
              'id': 1,
              'nome': 'nome test',
              'email': 'email@email.com',
              'telefone': '011 11111-1111'
            }
          ]);
      final result = await dao.call(1);
      expect(result, isA<Cliente>());
    });

    test('deve retornar null quando não encontrar um cliente', () async {
      when(() => mockConnection.query(any(), any()))
          .thenAnswer((_) async => []);
      final result = await dao.call(1);
      expect(result, isNull);
    });
  });
}
