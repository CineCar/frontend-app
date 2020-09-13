class MovieScreening {
  final int id;
  final DateTime date;

  MovieScreening({this.id, this.date});

  factory MovieScreening.fromJson(Map<String, dynamic> json) {
    return MovieScreening(
      id: json['id'],
      date: json['date'],
    );
  }
}
