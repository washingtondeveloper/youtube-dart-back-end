part of api;

class AddClienteHandler implements Handler {
  final AddClienteUseCase addClienteUseCase;

  AddClienteHandler({required this.addClienteUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) async {
    return ResponseHandler(
        status: StatusHandler.created,
        body: ClienteOutputDTO(
            id: 1,
            nome: 'nome test',
            email: 'email@email.com',
            telefone: '1234-1234'));
  }
}
