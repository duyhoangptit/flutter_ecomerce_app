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
        baseApiUrl = "";
        title = "UAT";
        break;
      }
      case Environment.prod: {
        baseApiUrl = "";
        title = "PROD";
        break;
      }
      default:
        break;
    }
  }
}