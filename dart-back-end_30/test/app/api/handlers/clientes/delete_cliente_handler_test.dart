import 'dart:async';

import 'package:dart_back_end_30/app/api/api.dart';
import 'package:dart_back_end_30/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClienteHandler handler;
  late MockDeleteClienteUseCase mockDeleteClienteUseCase;

  setUpAll(() {
    mockDeleteClienteUseCase = MockDeleteClienteUseCase();
    handler =
        DeleteClienteHandler(deleteClienteUseCase: mockDeleteClienteUseCase);
  });
  group('DeleteClienteHandler:', () {
    test('deve deletar um cliente retornando um status noContent', () async {
      when(() => mockDeleteClienteUseCase.call(any()))
          .thenAnswer((_) async => Completer<void>().complete());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.status, StatusHandler.noContent);
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockDeleteClienteUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockDeleteClienteUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect((result.body as MessageError).message, 'Cliente não encontrado');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockDeleteClienteUseCase.call(any())).thenThrow(Exception());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
