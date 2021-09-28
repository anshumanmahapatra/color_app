class ColorDetailsModel {
  final String hex;
  final String rgb;
  final String hsl;
  final String hsv;
  final String name;
  final String cmyk;
  final String xyz;
  final String imgUrl;
  final String contrast;

  ColorDetailsModel(
      {required this.hex,
      required this.rgb,
      required this.hsl,
      required this.hsv,
      required this.cmyk,
      required this.xyz,
      required this.name,
      required this.imgUrl,
      required this.contrast,
      });

  factory ColorDetailsModel.fromJson(Map json) {
    return ColorDetailsModel(
        hex: json['hex']['value'],
        rgb: json['rgb']['value'],
        hsl: json['hsl']['value'],
        hsv: json['hsv']['value'],
        name: json['name']['value'],
        cmyk: json['cmyk']['value'],
        xyz: json['XYZ']['value'],
        imgUrl: json['image']['named'],
        contrast: json['contrast']['value'],
        );
  }
}
