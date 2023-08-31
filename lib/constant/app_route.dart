class AppRoute {
  static Route initialRoute = Route(
    name: '',
    path: ''
  );
}

class Route {
  Route({required this.path, required this.name});
  final String path;
  final String name;
}