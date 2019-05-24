class Anime {
  int id; // mal_id
  String title; // title
  String image; // image_url
  String type; // type (ex) TV, OVA...

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
  }
}