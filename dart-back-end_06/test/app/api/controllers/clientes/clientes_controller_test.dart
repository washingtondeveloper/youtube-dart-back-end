import 'package:dart_back_end_06/app/api/api.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late ClientesController controller;
  late MockGetClientesUseCase mockGetClientesUseCase;

  setUpAll(() {
    mockGetClientesUseCase = MockGetClientesUseCase();
    controller = ClientesController(
      getClientesUseCase: mockGetClientesUseCase,
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
  });
}
