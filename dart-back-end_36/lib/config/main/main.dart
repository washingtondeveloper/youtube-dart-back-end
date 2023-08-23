part of config;

final controllers = <Controller>[
  ClientesController(
    getClientesUseCase: getIt(),
    addClienteUseCase: getIt(),
    getClienteByIdUseCase: getIt(),
    deleteClienteUseCase: getIt(),
    updateClienteUseCase: getIt(),
  )
];
