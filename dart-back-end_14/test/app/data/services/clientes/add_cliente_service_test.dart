import 'package:dart_back_end_14/app/data/data.dart';
import 'package:dart_back_end_14/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

class FakeCliente extends Fake implements Cliente {}

void main() {
  late AddClienteService service;
  late MockAddClienteGateway mockAddClienteGateway;

  setUpAll(() {
    mockAddClienteGateway = MockAddClienteGateway();
    service = AddClienteService(addClienteGateway: mockAddClienteGateway);

    registerFallbackValue(FakeCliente());
  });

  group('AddClienteService:', () {
    test('deve adicionar um cliente', () async {
      when(() => mockAddClienteGateway.call(any()))
          .thenAnswer((_) async => clienteMock);
      final result = await service.call(
          Cliente(id: 0, nome: 'nome', email: 'email', telefone: 'telefone'));

      expect(result, isA<Cliente>());
    });
  });
}
