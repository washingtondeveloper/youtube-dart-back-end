import 'package:dart_back_end_14/app/data/data.dart';
import 'package:dart_back_end_14/app/domain/domain.dart';
import 'package:dart_back_end_14/app/infra/infra.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientesUseCase extends Mock implements GetClientesUseCase {}

class MockGetClientesGateway extends Mock implements GetClientesGateway {}

class MockAddClienteUseCase extends Mock implements AddClienteUseCase {}

class MockAddClienteGateway extends Mock implements AddClienteGateway {}

class MockGetClienteByEmailGateway extends Mock
    implements GetClienteByEmailGateway {}

class MockConnection extends Mock implements Connection {}

final clienteMock =
    Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
