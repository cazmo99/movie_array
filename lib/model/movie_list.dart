import 'package:flutter/foundation.dart';
import 'package:movie_array/model/movie.dart';

class MovieList {
  final List<Movie>? movies;
  final int? page;
  final int? totalResults;
  final int? totalPages;

  MovieList({
    @required this.movies,
    @required this.page,
    @required this.totalResults,
    @required this.totalPages,
  });

  factory MovieList.fromJson(Map<String, dynamic> json) {
    List<Movie> movies = json['results']
          .map<Movie>(
            (dynamic item) => Movie.fromJson(item),
          )
          .toList();

    return MovieList(
      movies: movies,
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }

  int get length => movies!.length;
  List<Movie> get movieList => movies!;
}
