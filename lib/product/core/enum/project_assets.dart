/// ProjectAssets is a enum class that contains the path of the assets
enum ProjectAssets {
  /// The path to the favorite icon (SvG file)
  icHeard('favorite'),

  /// The path to the menu icon (SvG file)
  icMenu('menu'),

  /// The path to the app logo (Png file)
  imgAppLogo('app_logo'),

  /// The path to the splash image (Png file)
  imgSplash('splash'),

  /// The path to the splash subtitle (Png file)
  imgSplashSubtitle('splash_subtitle');

  /// The value of the enum
  final String value;

  // ignore: sort_constructors_first
  const ProjectAssets(this.value);

  /// The path to the PNG file
  String get toPng => 'assets/image/project_image/img_$value.png';

  /// The path to the SVG file
  String get toSvg => 'assets/icon/project_icon/ic_$value.svg';
}
