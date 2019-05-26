import 'package:jikan_list_sample/model/genre.dart';

class Anime {
  int id; // mal_id
  String title; // title
  String image; // image_url
  String type; // type (ex) TV, OVA...
  List<Genre> genres;

  Anime({
    this.id,
    this.title,
    this.image,
    this.type
  });

  Anime.fromJson(Map<String, dynamic> json) {
    id = json["mal_id"];
    title = json["title"];
    image = json["image_url"];
    type = json["type"];

    var genresFromJson = json["genres"] as List;
    genres = genresFromJson.map((it) => Genre.fromJson(it)).toList();
  }

  String allGenreString() {
    return genres.take(3).fold("", (value, element) => value += ' ${element.name} ');
  }
}