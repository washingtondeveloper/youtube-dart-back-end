import 'package:dart_back_end_28/app/api/api.dart';
import 'package:dart_back_end_28/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClienteByIdHandler handler;
  late MockGetClienteByIdUseCase mockGetClienteByIdUseCase;

  setUpAll(() {
    mockGetClienteByIdUseCase = MockGetClienteByIdUseCase();
    handler =
        GetClienteByIdHandler(getClienteByIdUseCase: mockGetClienteByIdUseCase);
  });

  group('GetClienteByIdHandler:', () {
    test('deve retornar um cliente', () async {
      when(() => mockGetClienteByIdUseCase.call(any()))
          .thenAnswer((_) async => clienteMock);
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.body, isA<ClienteOutputDTO>());
    });

    test('deve retornar um status notFound quando não encontrar um cliente',
        () async {
      when(() => mockGetClienteByIdUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.status, StatusHandler.notFound);
    });

    test('deve retornar uma mensagem quando não encontrar um cliente',
        () async {
      when(() => mockGetClienteByIdUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect((result.body as MessageError).message, 'Cliente não encontrado');
    });

    test(
        'deve retornar um status InternalServerError quando acontecer um erro desconhecido',
        () async {
      when(() => mockGetClienteByIdUseCase.call(any())).thenThrow(Exception());
      final result =
          await handler.call(RequestParams(path: {'clienteId': '1'}));

      expect(result.status, StatusHandler.internalServerError);
    });
  });
}
