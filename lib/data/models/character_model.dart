class Character {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> animeTitles;

  Character({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.animeTitles,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    final animeList = json['data']['anime'] as List<dynamic>? ?? [];

    return Character(
      id: json['data']['mal_id'],
      name: json['data']['name'] ?? "Unknown",
      imageUrl: json['data']['images']?['jpg']?['image_url'] ?? "",
      animeTitles: animeList
          .map((a) => a['anime']?['title'] ?? "Unknown Anime")
          .cast<String>()
          .toList(),
    );
  }
}
