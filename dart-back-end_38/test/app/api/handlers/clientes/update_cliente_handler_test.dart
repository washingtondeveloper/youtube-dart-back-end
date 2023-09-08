import 'package:dart_back_end_38/app/api/api.dart';
import 'package:dart_back_end_38/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late UpdateClienteHandler handler;
  late MockUpdateClienteUseCase mockUpdateClienteUseCase;

  setUpAll(() {
    mockUpdateClienteUseCase = MockUpdateClienteUseCase();
    handler =
        UpdateClienteHandler(updateClienteUseCase: mockUpdateClienteUseCase);

    registerFallbackValue(clienteMock);
  });

  group('UpdateClienteHandler:', () {
    test('deve atualizar um cliente', () async {
      when(() => mockUpdateClienteUseCase.call(any()))
          .thenAnswer((_) async => clienteMock);
      final result = await handler.call(RequestParams(path: {
        'clienteId': '1'
      }, body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1111-1111'
      }));

      expect(result.body, isA<ClienteOutputDTO>());
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockUpdateClienteUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result = await handler.call(RequestParams(path: {
        'clienteId': '1'
      }, body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1111-1111'
      }));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockUpdateClienteUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result = await handler.call(RequestParams(path: {
        'clienteId': '1'
      }, body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1111-1111'
      }));

      expect((result.body as MessageError).message, 'Cliente não encontrado');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockUpdateClienteUseCase.call(any())).thenThrow(Exception());
      final result = await handler.call(RequestParams(path: {
        'clienteId': '1'
      }, body: {
        'nome': 'nome test',
        'email': 'email@email.com',
        'telefone': '1111-1111'
      }));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
