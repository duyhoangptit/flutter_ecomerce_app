enum Environment {dev, prod}

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late String title;
  static late Environment _environment;
  static Environment get environment => _environment;
  static setupEnv(Environment env) {
    _environment = env;
    switch(env) {
      case Environment.dev: {
        baseApiUrl = "http://localhost:3056";
        title = "UAT";
        break;
      }
      case Environment.prod: {
        baseApiUrl = "http://localhost:8080";
        title = "PROD";
        break;
      }
      default:
        break;
    }
  }
}