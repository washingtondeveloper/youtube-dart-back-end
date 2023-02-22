import 'package:dart_back_end_02/app/api/api.dart';
import 'package:test/test.dart';

void main() {
  late ClientesController controller;

  setUpAll(() {
    controller = ClientesController();
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
