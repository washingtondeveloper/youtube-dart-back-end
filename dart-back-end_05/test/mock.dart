import 'package:dart_back_end_05/app/data/data.dart';
import 'package:dart_back_end_05/app/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockGetClientesUseCase extends Mock implements GetClientesUseCase {}

class MockGetClientesGateway extends Mock implements GetClientesGateway {}

final clienteMock =
    Cliente(id: 1, nome: 'nome', email: 'email', telefone: 'telefone');
