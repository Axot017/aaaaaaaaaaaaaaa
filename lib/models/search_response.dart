import 'package:aaaaaaaaaaaaaaa/models/movie_proposition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'Search')
  List<MoviePropositions> results;

  SearchResponse({this.results});
  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);
  Map<String, dynamic> get json => _$SearchResponseToJson(this);

  List<String> get titles => results?.map((i) => i.title)?.toList() ?? [];
}