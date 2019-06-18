class Animes {
  List<Anime> anime;

  Animes({
    this.anime
  });

  factory Animes.fromJson(Map<String, dynamic> json) {
    var list = json['anime'] as List;
    List<Anime> animeList = list.map((it) => Anime.fromJson(it)).toList();
    return Animes(anime: animeList);
  }
}

class Anime {
  int id;
  String url;
  String title;
  String imageUrl;
  String synopsis;
  String source;
  double score;

  Anime({
    this.id,
    this.url,
    this.title,
    this.imageUrl,
    this.synopsis,
    this.source,
    this.score
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      url: json['url'],
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
      source: json['source'],
      score: json['score']
    );
  }
}