part of config;

final _env = DotEnv(includePlatformEnvironment: true)..load();

abstract class ConfigEnv {
  static String dbUsername = _env['DB_USERNAME']!;
  static String dbPassword = _env['DB_PASSWORD']!;
  static String dbPort = _env['DB_PORT']!;
  static String dbDatabaseName = _env['DB_DATABASE_NAME']!;
  static String dbHost = _env['DB_HOST']!;
  static String serverPort = _env['PORT']!;
}
