import 'package:aaaaaaaaaaaaaaa/models/movie.dart';
import 'package:aaaaaaaaaaaaaaa/models/search_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'movies_api_provider.g.dart';

@RestApi(baseUrl: 'http://www.omdbapi.com/')
abstract class MoviesApiProvider {
  factory MoviesApiProvider (Dio dio, {String baseUrl}) = _MoviesApiProvider;

  @GET('http://www.omdbapi.com/')
  Future<SearchResponse> getPropositions(@Query("s") String text, {@Query("apikey") String apiKey = '4f6bad82'});

  @GET('http://www.omdbapi.com/')
  Future<Movie> getMovie(@Query("t") String title, {@Query("apikey") String apiKey = '4f6bad82'});
}