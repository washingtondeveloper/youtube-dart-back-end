import 'package:dart_back_end_23/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientesController controller;
  late MockGetClientesUseCase mockGetClientesUseCase;
  late MockAddClienteUseCase mockAddClienteUseCase;
  late MockGetClienteByIdUseCase mockGetClienteByIdUseCase;
  late MockDeleteClienteUseCase mockDeleteClienteUseCase;
  late MockUpdateClienteUseCase mockUpdateClienteUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    mockAddClienteUseCase = MockAddClienteUseCase();
    mockDeleteClienteUseCase = MockDeleteClienteUseCase();
    mockUpdateClienteUseCase = MockUpdateClienteUseCase();
    mockGetClienteByIdUseCase = MockGetClienteByIdUseCase();

    controller = ClientesController(
      getClientesUseCase: mockGetClientesUseCase,
      addClienteUseCase: mockAddClienteUseCase,
      deleteClienteUseCase: mockDeleteClienteUseCase,
      getClienteByIdUseCase: mockGetClienteByIdUseCase,
      updateClienteUseCase: mockUpdateClienteUseCase,
    );
  });

  group('ClientesController:', () {
    test('deve conter uma route "/clientes"', () async {
      expect(controller.route, '/clientes');
    });

    test('deve conter uma key "GET" para o handler GetClientesHandler',
        () async {
      expect(controller.handlers['GET'], isA<GetClientesHandler>());
    });

    test('deve conter uma key "POST" para o handler AddClienteHandler',
        () async {
      expect(controller.handlers['POST'], isA<AddClienteHandler>());
    });

    test(
        'deve conter uma key "GET /{clienteId}" para o handler GetClienteByIdHandler',
        () async {
      expect(controller.handlers['GET /{clienteId}'],
          isA<GetClienteByIdHandler>());
    });

    test(
        'deve conter uma key "DELETE /{clienteId}" para o handler DeleteClienteHandler',
        () async {
      expect(controller.handlers['DELETE /{clienteId}'],
          isA<DeleteClienteHandler>());
    });

    test(
        'deve conter uma key "PUT /{clienteId}" para o handler UpdateClienteHandler',
        () async {
      expect(
          controller.handlers['PUT /{clienteId}'], isA<UpdateClienteHandler>());
    });
  });
}
