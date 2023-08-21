import 'package:dart_back_end_34/app/api/api.dart';
import 'package:dart_back_end_34/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late AddClienteHandler handler;
  late MockAddClienteUseCase mockAddClienteUseCase;

  setUpAll(() {
    mockAddClienteUseCase = MockAddClienteUseCase();
    handler = AddClienteHandler(addClienteUseCase: mockAddClienteUseCase);

    registerFallbackValue(
        Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'));
  });

  group('AddClienteHandler:', () {
    test('deve retornar um status created', () async {
      when(() => mockAddClienteUseCase.call(any())).thenAnswer((_) async =>
          Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'));
      final result = await handler.call(RequestParams(body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1234-1234'
      }));

      expect(result.status, StatusHandler.created);
    });

    test('deve retornar um ClienteOutputDTO', () async {
      when(() => mockAddClienteUseCase.call(any())).thenAnswer((_) async =>
          Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone'));
      final result = await handler.call(RequestParams(body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1234-1234'
      }));

      expect(result.body, isA<ClienteOutputDTO>());
    });

    test(
        'deve retornar um status InternalServerError quando for error generico',
        () async {
      when(() => mockAddClienteUseCase.call(any())).thenThrow(Exception);
      final result = await handler.call(RequestParams(body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1234-1234'
      }));

      expect(result.status, StatusHandler.internalServerError);
    });

    test(
        'deve retornar um status badRequest existir um cliente com o mesmo email',
        () async {
      when(() => mockAddClienteUseCase.call(any()))
          .thenThrow(JaExisteUmClienteComEsseEmailException());
      final result = await handler.call(RequestParams(body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1234-1234'
      }));

      expect(result.status, StatusHandler.badRequest);
    });

    test('deve retornar uma mensagem "Ja existe um cliente com esse email"',
        () async {
      when(() => mockAddClienteUseCase.call(any()))
          .thenThrow(JaExisteUmClienteComEsseEmailException());
      final result = await handler.call(RequestParams(body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1234-1234'
      }));

      expect((result.body as MessageError).message,
          "Ja existe um cliente com esse email");
    });
  });
}
