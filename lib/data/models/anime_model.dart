class Anime {
  final String title;
  final String imageUrl;
  final int? episodes;
  final double? score;
  final int? scoredBy;
  final int? members;
  final String synopsis;
  final List<String> genres;

  Anime({
    required this.title,
    required this.imageUrl,
    required this.episodes,
    required this.score,
    required this.scoredBy,
    required this.members,
    required this.synopsis,
    required this.genres,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    // handle image safely
    String imgUrl = "";
    if (json['images'] != null &&
        json['images']['jpg'] != null &&
        json['images']['jpg']['image_url'] != null) {
      imgUrl = json['images']['jpg']['image_url'];
    }

    // handle genres
    List<String> genreNames = [];
    if (json['genres'] != null && json['genres'] is List) {
      for (var g in json['genres']) {
        if (g['name'] != null) {
          genreNames.add(g['name']);
        }
      }
    }

    return Anime(
      title: json['title'] ?? "",
      imageUrl: imgUrl,
      episodes: json['episodes'],
      score: (json['score'] is num) ? json['score'].toDouble() : null,
      scoredBy: json['scored_by'],
      members: json['members'],
      synopsis: json['synopsis'] ?? "",
      genres: genreNames,
    );
  }
}
