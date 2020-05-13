// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_api_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MoviesApiProvider implements MoviesApiProvider {
  _MoviesApiProvider(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://www.omdbapi.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getPropositions(text, {apiKey = '4f6bad82'}) async {
    ArgumentError.checkNotNull(text, 'text');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'s': text, 'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getMovie(title, {apiKey = '4f6bad82'}) async {
    ArgumentError.checkNotNull(title, 'title');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'t': title, 'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Movie.fromJson(_result.data);
    return Future.value(value);
  }
}
