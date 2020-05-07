import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Runtime')
  String time;
  @JsonKey(name: 'Genre')
  String type;
  @JsonKey(name: 'Director')
  String director;
  @JsonKey(name: 'Poster')
  String image;

  Movie({this.title, this.type, this.time, this.image, this.director});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> get json => _$MovieToJson(this);
}