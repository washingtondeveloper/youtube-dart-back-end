import 'dart:async';

import 'package:dart_back_end_38/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClienteDAO dao;
  late MockConnection mockConnection;

  setUpAll(() {
    mockConnection = MockConnection();
    dao = DeleteClienteDAO(mockConnection);
  });

  group('DeleteClienteDAO:', () {
    test('deve remover um cliente', () async {
      when(() => mockConnection.close())
          .thenAnswer((_) async => Completer().complete());
      when(() => mockConnection.query(any(), any()))
          .thenAnswer((_) async => []);

      await dao.call(1);

      verify(() => mockConnection.query(any(), any())).called(1);
      verify(() => mockConnection.close()).called(1);
    });
  });
}
