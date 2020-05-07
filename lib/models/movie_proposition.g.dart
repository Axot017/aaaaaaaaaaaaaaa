// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_proposition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePropositions _$MoviePropositionsFromJson(Map<String, dynamic> json) {
  return MoviePropositions(
    type: json['Type'] as String,
    title: json['Title'] as String,
    id: json['imdbID'] as String,
    poster: json['Poster'] as String,
  );
}

Map<String, dynamic> _$MoviePropositionsToJson(MoviePropositions instance) =>
    <String, dynamic>{
      'imdbID': instance.id,
      'Title': instance.title,
      'Type': instance.type,
      'Poster': instance.poster,
    };
