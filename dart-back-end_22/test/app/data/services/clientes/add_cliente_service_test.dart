import 'package:dart_back_end_22/app/data/data.dart';
import 'package:dart_back_end_22/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

class FakeCliente extends Fake implements Cliente {}

void main() {
  late AddClienteService service;
  late MockAddClienteGateway mockAddClienteGateway;
  late MockGetClienteByEmailGateway getClienteByEmailGateway;

  setUpAll(() {
    mockAddClienteGateway = MockAddClienteGateway();
    getClienteByEmailGateway = MockGetClienteByEmailGateway();
    service = AddClienteService(
      addClienteGateway: mockAddClienteGateway,
      getClienteByEmailGateway: getClienteByEmailGateway,
    );

    registerFallbackValue(FakeCliente());
  });

  group('AddClienteService:', () {
    test('deve adicionar um cliente', () async {
      when(() => getClienteByEmailGateway.call(any()))
          .thenAnswer((_) async => null);
      when(() => mockAddClienteGateway.call(any()))
          .thenAnswer((_) async => clienteMock);
      final result = await service.call(
          Cliente(id: 0, nome: 'nome', email: 'email', telefone: 'telefone'));

      expect(result, isA<Cliente>());
    });

    test(
        'deve lancar um JaExisteUmClienteComEsseEmailExceptiom quando tentar cadastrar um cliente com o mesmo email',
        () async {
      when(() => getClienteByEmailGateway.call(any()))
          .thenAnswer((_) async => clienteMock);

      expect(
          () => service.call(Cliente(
              id: 0, nome: 'nome', email: 'email', telefone: 'telefone')),
          throwsA(isA<JaExisteUmClienteComEsseEmailException>()));
    });
  });
}
