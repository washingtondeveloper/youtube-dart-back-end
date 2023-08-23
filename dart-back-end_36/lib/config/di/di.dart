part of config;

GetIt getIt = GetIt.instance;

abstract class Inject {
  void call(GetIt getIt);
}

final injects = <Inject>[
  ClientesInject(),
];

abstract class ApiDI {
  static void init() {
    getIt.registerSingleton<Connection>(PostgreSQL());
    for (final inject in injects) {
      inject(getIt);
    }
  }
}
