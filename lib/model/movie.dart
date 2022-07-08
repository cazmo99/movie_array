import 'package:flutter/foundation.dart';

class Movie {
  final int? id;
  final String? title;
  final String? posterPath;
  final bool? adult;
  final double? voteAverage;
  final String? overview;
  final int? voteCount;
  final String? releaseDate;

  Movie({
    @required this.id,
    @required this.title,
    @required this.posterPath,
    @required this.adult,
    @required this.voteAverage,
    @required this.overview,
    @required this.voteCount,
    @required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      adult: json['adult'] as bool,
      voteAverage: double.parse(json['vote_average'].toString()),
      overview: json['overview'] as String,
      voteCount: json['vote_count'] as int,
      releaseDate: json['release_date'] as String,
    );
  }
}
