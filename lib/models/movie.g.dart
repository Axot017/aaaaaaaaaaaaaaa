// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['Title'] as String,
    type: json['Genre'] as String,
    time: json['Runtime'] as String,
    image: json['Poster'] as String,
    director: json['Director'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'Title': instance.title,
      'Runtime': instance.time,
      'Genre': instance.type,
      'Director': instance.director,
      'Poster': instance.image,
    };
