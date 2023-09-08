import 'dart:convert';
import 'dart:io';

import 'package:dart_back_end_38/app/infra/infra.dart';
import 'package:dart_back_end_38/config/config.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = ConfigEnv.serverPort;
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

    // delete na base
    final connection = PostgreSQL();
    await connection.query("DELETE FROM clientes");
    await connection.close();
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

    test('GET /clientes/{clienteId} 200', () async {
      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email@email.com",
            "telefone": "011 1111-1111"
          }));

      final cliente = jsonDecode(response.body);

      final responsePesquisa =
          await get(Uri.parse('$host/clientes/${cliente["id"]}'));
      expect(responsePesquisa.statusCode, 200);
    });

    test('DELETE /clientes/{clienteId} 404', () async {
      final response = await delete(Uri.parse('$host/clientes/-1'));
      expect(response.statusCode, 404);
    });

    test('DELETE /clientes/{clienteId} 204', () async {
      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email@email.com",
            "telefone": "011 1111-1111"
          }));

      final cliente = jsonDecode(response.body);

      final responseDELETE =
          await delete(Uri.parse('$host/clientes/${cliente["id"]}'));
      expect(responseDELETE.statusCode, 204);
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

    test('PUT /clientes/{clienteId} 200', () async {
      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email@email.com",
            "telefone": "011 1111-1111"
          }));

      final cliente = jsonDecode(response.body);

      final responseUpdate = await put(
          Uri.parse('$host/clientes/${cliente["id"]}'),
          body: jsonEncode({
            "nome": "nome test 1",
            "email": "email1@email.com",
            "telefone": "022 1111-1111"
          }));

      final clienteUpdated = jsonDecode(responseUpdate.body);
      expect(responseUpdate.statusCode, 200);
      expect(clienteUpdated["nome"], "nome test 1");
      expect(clienteUpdated["email"], "email1@email.com");
      expect(clienteUpdated["telefone"], "022 1111-1111");
    });

    test('POST /clientes 201', () async {
      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email1@email1.com",
            "telefone": "011 1111-1111"
          }));
      expect(response.statusCode, 201);
    });

    test('POST /clientes 400', () async {
      await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email1@email1.com",
            "telefone": "011 1111-1111"
          }));

      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email1@email1.com",
            "telefone": "011 1111-1111"
          }));
      expect(response.statusCode, 400);
    });

    test('POST /clientes 400 - Ja existe um cliente com esse email', () async {
      await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email1@email1.com",
            "telefone": "011 1111-1111"
          }));

      final response = await post(Uri.parse('$host/clientes'),
          body: jsonEncode({
            "nome": "nome test",
            "email": "email1@email1.com",
            "telefone": "011 1111-1111"
          }));
      expect(jsonDecode(response.body)["message"],
          "Ja existe um cliente com esse email");
    });
  });
}
