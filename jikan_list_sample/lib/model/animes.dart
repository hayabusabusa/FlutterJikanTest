import 'anime.dart';

class Animes {
  List<Anime> items;

  Animes({
    this.items
  });

  Animes.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json["anime"] as List;
    items = itemsFromJson.map((it) => Anime.fromJson(it)).toList();
  }

  List<Anime> tvTypeList() {
    return items.map((it) {
      if (it.type == "TV") {
        return it;
      }
    });
  }
}