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

  Anime({
    this.id,
    this.url,
    this.title,
    this.imageUrl
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      url: json['url'],
      title: json['title'],
      imageUrl: json['image_url']
    );
  }
}