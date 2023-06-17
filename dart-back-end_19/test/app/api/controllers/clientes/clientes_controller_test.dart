import 'package:dart_back_end_19/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientesController controller;
  late MockGetClientesUseCase mockGetClientesUseCase;
  late MockAddClienteUseCase mockAddClienteUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    mockAddClienteUseCase = MockAddClienteUseCase();

    controller = ClientesController(
      getClientesUseCase: mockGetClientesUseCase,
      addClienteUseCase: mockAddClienteUseCase,
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
  });
}
