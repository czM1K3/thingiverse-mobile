import 'package:thingiversemobile/models/thingiverse/size.dart';

class ThingiverseImage {
  final int id;
  final String name, url;
  final List<ThingiverseSize> sizes;

  const ThingiverseImage({
    required this.id,
    required this.name,
    required this.url,
    required this.sizes,
  });

  factory ThingiverseImage.fromJson(Map<String, dynamic> json) {
    return ThingiverseImage(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      sizes: (json['sizes'] as List<dynamic>)
          .map((e) => ThingiverseSize.fromJson(e))
          .toList(),
    );
  }
}
