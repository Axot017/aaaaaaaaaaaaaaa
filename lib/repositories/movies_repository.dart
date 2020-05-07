import 'package:aaaaaaaaaaaaaaa/api/movies_api_provider.dart';
import 'package:aaaaaaaaaaaaaaa/models/movie.dart';
import 'package:aaaaaaaaaaaaaaa/models/search_response.dart';

class MoviesRepository {
  MoviesApiProvider _apiProvider;

  MoviesRepository(this._apiProvider);

  Future<SearchResponse> getPropositions(String text) => _apiProvider.getPropositions(text);

  Future<Movie> getMovie(String id) => _apiProvider.getMovie(id);
}