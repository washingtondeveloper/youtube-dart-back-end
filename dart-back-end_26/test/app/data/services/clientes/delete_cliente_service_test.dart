import 'dart:async';

import 'package:dart_back_end_26/app/data/data.dart';
import 'package:dart_back_end_26/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late DeleteClienteService service;
  late MockDeleteClienteGateway mockDeleteClienteGateway;
  late MockGetClienteByIdUseCase mockGetClienteByIdUseCase;

  setUpAll(() {
    mockDeleteClienteGateway = MockDeleteClienteGateway();
    mockGetClienteByIdUseCase = MockGetClienteByIdUseCase();
    service = DeleteClienteService(
      deleteClienteGateway: mockDeleteClienteGateway,
      getClienteByIdUseCase: mockGetClienteByIdUseCase,
    );
  });
  group('DeleteClienteSerivce;', () {
    test('deve deletar um cliente', () async {
      when(() => mockGetClienteByIdUseCase.call(any()))
          .thenAnswer((_) async => clienteMock);
      when(() => mockDeleteClienteGateway.call(any()))
          .thenAnswer((_) async => Completer<void>().complete());
      await service.call(1);

      verify(() => mockDeleteClienteGateway.call(1)).called(1);
    });

    test(
        'deve lancar um ClienteNotFoundException quando não encontrar um cliente',
        () async {
      when(() => mockGetClienteByIdUseCase.call(any()))
          .thenThrow(ClienteNotFoundException());
      expect(() => service.call(1), throwsA(isA<ClienteNotFoundException>()));
    });
  });
}
