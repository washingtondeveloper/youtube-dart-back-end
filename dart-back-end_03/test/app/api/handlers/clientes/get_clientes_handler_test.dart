import 'package:dart_back_end_02/app/api/api.dart';
import 'package:test/test.dart';

void main() {
  test('deve retornar uma instancia de ResponseHandler', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result, isA<ResponseHandler>());
  });

  test('deve retornar um status ok', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result.status, StatusHandler.ok);
  });

  test('deve retornar uma lista de ClienteOutputDTO', () async {
    final handler = GetClientesHandler();
    final result = await handler.call();

    expect(result.body, isA<List<ClienteOutputDTO>>());
  });
}
