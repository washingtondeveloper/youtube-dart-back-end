part of api;

class AddClienteHandler implements Handler {
  final AddClienteUseCase addClienteUseCase;

  AddClienteHandler({required this.addClienteUseCase});
  @override
  Future<ResponseHandler> call() {
    throw UnimplementedError();
  }
}
