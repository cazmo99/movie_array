class HttpRequest {
  final String _mainURL = "https://api.themoviedb.org/3";
  final Map<String, String> _queryParams = {
    'api_key': '177839045441aec14740cfd911bc9ede',
  };

  String get discover => '$_mainURL/discover/movie';
  
  Map<String,String> get queryParams => _queryParams;
  String get mainURL => _mainURL;
}
