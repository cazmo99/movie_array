// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/screen/movie_list/movie_list_view.dart';

class Routes {
  static const String movieListView = '/';
  static const all = <String>{
    movieListView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.movieListView, page: MovieListView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MovieListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MovieListView(),
        settings: data,
      );
    },
  };
}
