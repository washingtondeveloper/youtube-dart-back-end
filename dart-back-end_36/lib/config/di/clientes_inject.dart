part of config;

class ClientesInject implements Inject {
  @override
  void call(GetIt getIt) {
    // GetClientes
    getIt.registerSingleton<GetClientesGateway>(
        GetClientesDAO(connection: getIt()));
    getIt.registerSingleton<GetClientesUseCase>(
        GetClientesService(getClientesGateway: getIt()));

    // GetClientesById
    getIt.registerSingleton<GetClienteByIdGateway>(GetClienteByIdDAO(getIt()));
    getIt.registerSingleton<GetClienteByIdUseCase>(
        GetClienteByIdService(getClienteByIdGateway: getIt()));

    // GetClienteByEmail
    getIt.registerSingleton<GetClienteByEmailGateway>(
        GetClienteByEmailDAO(getIt()));

    // DeleteCliente
    getIt.registerSingleton<DeleteClienteGateway>(DeleteClienteDAO(getIt()));
    getIt.registerSingleton<DeleteClienteUseCase>(DeleteClienteService(
        deleteClienteGateway: getIt(), getClienteByIdUseCase: getIt()));

    // UpdateCliente
    getIt.registerSingleton<UpdateClienteGateway>(UpdateClienteDAO(getIt()));
    getIt.registerSingleton<UpdateClienteUseCase>(UpdateClienteService(
        updateClienteGateway: getIt(), getClienteByIdUseCase: getIt()));

    // AddCliente
    getIt.registerSingleton<AddClienteGateway>(AddClienteDAO(getIt()));
    getIt.registerSingleton<AddClienteUseCase>(AddClienteService(
        addClienteGateway: getIt(), getClienteByEmailGateway: getIt()));
  }
}
