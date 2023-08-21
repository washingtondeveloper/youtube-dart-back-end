import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  final host = 'http://0.0.0.0:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;
  });

  tearDown(() => p.kill());

  group('API clientes:', () {
    test('deve conter content-type "application/json"', () async {
      final response = await get(Uri.parse('$host/clientes'));
      expect(response.headers['content-type'], 'application/json');
    });

    test('GET /clientes 200', () async {
      final response = await get(Uri.parse('$host/clientes'));
      expect(response.statusCode, 200);
    });

    test('GET /clientes/{clienteId} 404', () async {
      final response = await get(Uri.parse('$host/clientes/-1'));
      expect(response.statusCode, 404);
    });

    test('DELETE /clientes/{clienteId} 404', () async {
      final response = await delete(Uri.parse('$host/clientes/-1'));
      expect(response.statusCode, 404);
    });

    test('PUT /clientes/{clienteId} 404', () async {
      final response = await put(Uri.parse('$host/clientes/-1'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email@email.com",
            "telefone": "011 1111-1111"
          }));
      expect(response.statusCode, 404);
    });
  });
}
