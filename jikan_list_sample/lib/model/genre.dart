class Genre {
  int id;
  String name;

  Genre(this.name);

  Genre.fromJson(Map<String, dynamic> json) {
    id = json["mal_id"];
    name = json["name"];
  }
}