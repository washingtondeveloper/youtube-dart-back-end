part of config;

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: GetClientesService(
      getClientesGateway: GetClientesDAO(
        connection: PostgreSQL(),
      ),
    ),
  ),
];
