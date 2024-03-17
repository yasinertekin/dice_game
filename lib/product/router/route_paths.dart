/// Route paths for the application
enum RoutePaths {
  /// Initial route
  initial('/'),

  /// Home route
  home('/home'),

  /// User dice route
  userDice('/user-dice');

  const RoutePaths(this.path);

  /// Path of the route
  final String path;
}
