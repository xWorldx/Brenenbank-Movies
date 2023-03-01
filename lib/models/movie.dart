class Movie {
  final String id;
  final String name;
  final String image;
  final String year;
  final String type;

  Movie({this.id, this.name, this.image, this.year, this.type});

  factory Movie.fromJason(Map<String, dynamic> map) {
    return Movie(id: map["imdbID"], name: map["Title"], image: map["Poster"], year: map["Year"], type: map["Type"]);
  }
}
