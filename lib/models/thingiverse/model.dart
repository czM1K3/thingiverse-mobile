import 'package:thingiversemobile/models/thingiverse/creator.dart';

class ThingiverseModel {
  final int id;
  final String name, url, publicUrl, createdAt, thumbnail, previewImage;
  final ThingiverseCreator creator;

  const ThingiverseModel({
    required this.id,
    required this.name,
    required this.url,
    required this.publicUrl,
    required this.createdAt,
    required this.thumbnail,
    required this.previewImage,
    required this.creator,
  });

  factory ThingiverseModel.fromJson(Map<String, dynamic> json) {
    return ThingiverseModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      publicUrl: json['public_url'],
      createdAt: json['created_at'],
      thumbnail: json['thumbnail'],
      previewImage: json['preview_image'],
      creator: ThingiverseCreator.fromJson(json['creator']),
    );
  }
}
