import 'package:json_annotation/json_annotation.dart';

part 'movie_proposition.g.dart';

@JsonSerializable()
class MoviePropositions {
  @JsonKey(name: 'imdbID')
  String id;
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Type')
  String type;
  @JsonKey(name: 'Poster')
  String poster;

  MoviePropositions({this.type, this.title, this.id, this.poster});

  factory MoviePropositions.fromJson(Map<String, dynamic> json) => _$MoviePropositionsFromJson(json);

  Map<String, dynamic> get json => _$MoviePropositionsToJson(this);
}