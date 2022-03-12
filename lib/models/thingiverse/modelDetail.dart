import 'package:thingiversemobile/models/thingiverse/creator.dart';
import 'package:thingiversemobile/models/thingiverse/image.dart';

class ThingiverseModelDetail {
  final int id;
  final String name,
      thumbnail,
      url,
      publicUrl,
      added,
      modified,
      description,
      instructions,
      descriptionHtml,
      instructionsHtml,
      license;
  final bool isNsfw;
  final ThingiverseCreator creator;
  final List<ThingiverseImage> images;

  const ThingiverseModelDetail({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.url,
    required this.publicUrl,
    required this.added,
    required this.modified,
    required this.isNsfw,
    required this.description,
    required this.instructions,
    required this.descriptionHtml,
    required this.instructionsHtml,
    required this.license,
    required this.creator,
    required this.images,
  });

  factory ThingiverseModelDetail.fromJson(
      Map<String, dynamic> json, List<ThingiverseImage> images) {
    return ThingiverseModelDetail(
      id: json['id'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      url: json['url'],
      publicUrl: json['public_url'],
      added: json['added'],
      modified: json['modified'],
      isNsfw: json['is_nsfw'],
      description: json['description'],
      instructions: json['instructions'],
      descriptionHtml: json['description_html'],
      instructionsHtml: json['instructions_html'],
      license: json['license'],
      creator: ThingiverseCreator.fromJson(json['creator']),
      images: images,
    );
  }
}
