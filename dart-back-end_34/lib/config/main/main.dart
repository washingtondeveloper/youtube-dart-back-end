part of config;

final connection = PostgreSQL();

final getClienteByIdUseCase = GetClienteByIdService(
  getClienteByIdGateway: GetClienteByIdDAO(connection),
);

final getClientesUseCase = GetClientesService(
  getClientesGateway: GetClientesDAO(connection: connection),
);

final addClienteUseCase = AddClienteService(
  addClienteGateway: AddClienteDAO(connection),
  getClienteByEmailGateway: GetClienteByEmailDAO(connection),
);

final deleteClienteUseCase = DeleteClienteService(
  deleteClienteGateway: DeleteClienteDAO(connection),
  getClienteByIdUseCase: getClienteByIdUseCase,
);

final updateClienteUseCase = UpdateClienteService(
  updateClienteGateway: UpdateClienteDAO(connection),
  getClienteByIdUseCase: getClienteByIdUseCase,
);

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: getClientesUseCase,
    addClienteUseCase: addClienteUseCase,
    getClienteByIdUseCase: getClienteByIdUseCase,
    deleteClienteUseCase: deleteClienteUseCase,
    updateClienteUseCase: updateClienteUseCase,
  )
];
