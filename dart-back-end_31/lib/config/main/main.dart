part of config;

final connection = PostgreSQL();

final addClienteUseCase = AddClienteService(
  addClienteGateway: AddClienteDAO(connection),
  getClienteByEmailGateway: GetClienteByEmailDAO(connection),
);

final getClienteByIdUseCase = GetClienteByIdService(
  getClienteByIdGateway: GetClienteByIdDAO(connection),
);

final deleteClienteUseCase = DeleteClienteService(
  deleteClienteGateway: DeleteClienteDAO(connection),
  getClienteByIdUseCase: getClienteByIdUseCase,
);

final getClientesUseCase = GetClientesService(
  getClientesGateway: GetClientesDAO(connection: connection),
);

final updateClienteUseCase = UpdateClienteService(
  updateClienteGateway: UpdateClienteDAO(connection),
  getClienteByIdUseCase: getClienteByIdUseCase,
);

final controllers = <Controller>[
  ClientesController(
    addClienteUseCase: addClienteUseCase,
    deleteClienteUseCase: deleteClienteUseCase,
    getClienteByIdUseCase: getClienteByIdUseCase,
    getClientesUseCase: getClientesUseCase,
    updateClienteUseCase: updateClienteUseCase,
  ),
];
