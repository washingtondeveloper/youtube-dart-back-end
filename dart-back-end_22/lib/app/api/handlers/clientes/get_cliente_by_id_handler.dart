part of api;

class GetClienteByIdHandler implements Handler {
  final GetClienteByIdUseCase getClienteByIdUseCase;

  GetClienteByIdHandler({required this.getClienteByIdUseCase});
  @override
  Future<ResponseHandler> call(RequestParams requestParams) {
    throw UnimplementedError();
  }
}
