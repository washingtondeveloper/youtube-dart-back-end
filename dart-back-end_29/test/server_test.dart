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
      expect(response.statusCode, 200);
      expect(response.headers['content-type'], 'application/json');
    });
  });
}
