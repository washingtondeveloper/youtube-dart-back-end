part of config;

final connection = PostgreSQL();

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: GetClientesService(
      getClientesGateway: GetClientesDAO(
        connection: connection,
      ),
    ),
    addClienteUseCase: AddClienteService(
      addClienteGateway: AddClienteDAO(connection),
      getClienteByEmailGateway: GetClienteByEmailDAO(connection),
    ),
  ),
];
