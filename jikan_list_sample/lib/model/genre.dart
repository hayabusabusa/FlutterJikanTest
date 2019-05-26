class Genre {
  String name;

  Genre(this.name);

  Genre.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}