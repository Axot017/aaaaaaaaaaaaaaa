import 'package:aaaaaaaaaaaaaaa/enums/record_type.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'library_record.g.dart';

@JsonSerializable()
class LibraryRecord {
  String uid;
  RecordType recordType;
  String title;
  String type;
  bool multiplayer;
  String imageUrl;
  String author;
  int score;
  String numberOfPages;
  String seasons;
  String length;
  String platform;
  bool viewed;

  LibraryRecord({
    this.uid,
    this.recordType,
    this.title,
    this.imageUrl,
    this.length,
    this.author,
    this.numberOfPages,
    this.score,
    this.viewed,
    this.seasons,
    this.type,
    this.multiplayer
  });

  String get authorLabel {
    switch (recordType) {
      case RecordType.GAME:
        return 'Studio';
      case RecordType.SERIES:
      case RecordType.MOVIE:
        return 'Director';
      case RecordType.BOOK:
        return 'Author';
      default:
        return 'Author';
    }
  }

  String get multiplayerLabel {
    if (multiplayer == null) return null;
    if (multiplayer) {
      return 'Multiplayer';
    } else {
      return 'Singleplayer';
    }
  }

  void nullUnnecessaryFields() {
    if (recordType == RecordType.SERIES) {
      length = null;
      numberOfPages = null;
      platform = null;
      multiplayer = null;
    } else if (recordType == RecordType.MOVIE) {
      seasons = null;
      numberOfPages = null;
      platform = null;
      multiplayer = null;
    } else if (recordType == RecordType.BOOK) {
      length = null;
      seasons = null;
      platform = null;
      multiplayer = null;
    } else if (recordType == RecordType.GAME) {
      length = null;
      numberOfPages = null;
      seasons = null;
    }
  }

  factory LibraryRecord.fromJson(json) => _$LibraryRecordFromJson(json);

  Map<String, dynamic> get toJson => _$LibraryRecordToJson(this);

  IconData get icon {
    if (recordType == RecordType.MOVIE) return Icons.local_movies;
    else if (recordType == RecordType.BOOK) return Icons.import_contacts;
    else if (recordType == RecordType.GAME) return Icons.computer;
    else if (recordType == RecordType.SERIES) return Icons.playlist_play;
    else return Icons.edit;
  }
}