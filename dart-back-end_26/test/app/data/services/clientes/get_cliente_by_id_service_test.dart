import 'package:dart_back_end_26/app/data/data.dart';
import 'package:dart_back_end_26/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../mock.dart';

void main() {
  late GetClienteByIdService service;
  late MockGetClienteByIdGateway mockGetClienteByIdGateway;

  setUpAll(() {
    mockGetClienteByIdGateway = MockGetClienteByIdGateway();
    service =
        GetClienteByIdService(getClienteByIdGateway: mockGetClienteByIdGateway);
  });
  group('GetClienteByIdService:', () {
    test('deve retornar um cliente', () async {
      when(() => mockGetClienteByIdGateway.call(any()))
          .thenAnswer((_) async => clienteMock);
      final result = await service.call(1);

      expect(result, isA<Cliente>());
    });

    test(
        'deve lancar um ClienteNotFoundException quando não encontrar um cliente',
        () async {
      when(() => mockGetClienteByIdGateway.call(any()))
          .thenAnswer((_) async => null);

      expect(() => service.call(1), throwsA(isA<ClienteNotFoundException>()));
    });
  });
}
