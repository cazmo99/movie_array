import 'package:dio/dio.dart';
import 'package:movie_array/model/movie_list.dart';
import 'package:movie_array/utils/request.dart';

class API {
  final HttpRequest _request = HttpRequest();
  final Dio _dio = Dio();

  Future<MovieList> getMovies({int? page}) async {
    if(page != null){
      _request.queryParams.addEntries([MapEntry('page', page.toString())]);
    }

    Response response = await _dio.get(_request.discover,
        queryParameters: _request.queryParams);

    if(response.statusCode == 200){
      return MovieList.fromJson(response.data);
    } else{
      throw response.data;
    }
  }
}
