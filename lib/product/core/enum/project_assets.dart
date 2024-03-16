/// ProjectAssets is a enum class that contains the path of the assets
enum ProjectAssets {
  /// The path to the favorite icon (SvG file)
  heard('favorite'),

  /// The path to the menu icon (SvG file)
  menu('menu');

  /// The value of the enum
  final String value;

  // ignore: sort_constructors_first
  const ProjectAssets(this.value);

  /// The path to the PNG file
  String get toPng => 'assets/image/img_$value.png';

  /// The path to the SVG file
  String get toSvg => 'assets/icon/ic_$value.svg';
}
