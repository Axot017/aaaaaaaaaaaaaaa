// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryRecord _$LibraryRecordFromJson(Map<String, dynamic> json) {
  return LibraryRecord(
    uid: json['uid'] as String,
    recordType: _$enumDecodeNullable(_$RecordTypeEnumMap, json['recordType']),
    title: json['title'] as String,
    imageUrl: json['imageUrl'] as String,
    length: json['length'] as String,
    author: json['author'] as String,
    numberOfPages: json['numberOfPages'] as String,
    score: json['score'] as int,
    viewed: json['viewed'] as bool,
    seasons: json['seasons'] as String,
    type: json['type'] as String,
    multiplayer: json['multiplayer'] as bool,
  )..platform = json['platform'] as String;
}

Map<String, dynamic> _$LibraryRecordToJson(LibraryRecord instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'recordType': _$RecordTypeEnumMap[instance.recordType],
      'title': instance.title,
      'type': instance.type,
      'multiplayer': instance.multiplayer,
      'imageUrl': instance.imageUrl,
      'author': instance.author,
      'score': instance.score,
      'numberOfPages': instance.numberOfPages,
      'seasons': instance.seasons,
      'length': instance.length,
      'platform': instance.platform,
      'viewed': instance.viewed,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RecordTypeEnumMap = {
  RecordType.BOOK: 'BOOK',
  RecordType.GAME: 'GAME',
  RecordType.MOVIE: 'MOVIE',
  RecordType.SERIES: 'SERIES',
};
