class ThingiverseSize {
  final String type, size, url;

  ThingiverseSize({
    required this.type,
    required this.size,
    required this.url,
  });

  factory ThingiverseSize.fromJson(Map<String, dynamic> json) {
    return ThingiverseSize(
      type: json["type"],
      size: json["size"],
      url: json["url"],
    );
  }
}
