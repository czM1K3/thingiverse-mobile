class ThingiverseCreator {
  final int id, countOfFollowers, countOfFollowing, countOfDesigns;
  final String name,
      firstName,
      lastName,
      url,
      publicUrl,
      thumbnail,
      location,
      cover;
  final bool acceptsTips, isFollowing;

  const ThingiverseCreator({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.url,
    required this.publicUrl,
    required this.thumbnail,
    required this.countOfFollowers,
    required this.countOfFollowing,
    required this.countOfDesigns,
    required this.acceptsTips,
    required this.isFollowing,
    required this.location,
    required this.cover,
  });

  factory ThingiverseCreator.fromJson(Map<String, dynamic> json) {
    return ThingiverseCreator(
      id: json['id'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      url: json['url'],
      publicUrl: json['public_url'],
      thumbnail: json['thumbnail'],
      countOfFollowers: json['count_of_followers'],
      countOfFollowing: json['count_of_following'],
      countOfDesigns: json['count_of_designs'],
      acceptsTips: json['accepts_tips'],
      isFollowing: json['is_following'],
      location: json['location'],
      cover: json['cover'],
    );
  }
}
