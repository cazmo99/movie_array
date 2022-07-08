import 'package:flutter/material.dart';
import 'package:movie_array/app/app.locator.dart';
import 'package:movie_array/model/movie_list.dart';
import 'package:movie_array/ui/screen/movie_detail_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../model/movie.dart';
import '../../../service/api_service.dart';

class MovieListViewModel extends BaseViewModel {
  late List<Movie> _movieList;
  late MovieList _movies;
  late ScrollController _controller;
  final API _api = locator<API>();
  final NavigationService _navigation = locator<NavigationService>();

  late bool _isLoadMoreRunning = false;
  late bool _hasNextPage = true;
  late bool _isRequesting = false;
  final String _mainUrl = 'https://image.tmdb.org/t/p/w500';

  List<Movie> get movieList => _movieList;
  bool get isLoadMoreRunning => _isLoadMoreRunning;
  bool get hasNextPage => _hasNextPage;
  String get mainUrl => _mainUrl;

  void showDetail(Movie movie) {
    _navigation.navigateWithTransition(MovieDetailView(movie: movie,),
        transitionStyle: Transition.fade);
  }

  void setScrollController(ScrollController sc) {
    _controller = sc;
    _controller.addListener(_loadMore);
  }

  void removeListner() {
    _controller.removeListener(_loadMore);
  }

  void firstLoad() async {
    setBusy(true);
    _movies = await _api.getMovies();
    _movieList = _movies.movieList;
    setBusy(false);
  }

  void _loadMore() async {
    var triggerFetchMoreSize = 0.9 * _controller.position.maxScrollExtent;
    if (_controller.position.pixels > triggerFetchMoreSize) {
      if (_movies.page == _movies.totalPages) {
        _hasNextPage = false;
        notifyListeners();
      } else {
        if (!_isRequesting) {
          _isRequesting = true;
          _isLoadMoreRunning = true;
          notifyListeners();
          int newPage = _movies.page! + 1;
          _movies = await _api.getMovies(page: newPage);
          _movieList = List.from(_movieList)..addAll(_movies.movieList);
          _isLoadMoreRunning = false;
          notifyListeners();
          _isRequesting = false;
        }
      }
    }
  }
}
