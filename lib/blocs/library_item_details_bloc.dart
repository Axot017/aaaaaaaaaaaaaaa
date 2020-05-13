import 'package:aaaaaaaaaaaaaaa/enums/record_type.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class LibraryItemDetailsBloc extends BlocBase {
  BehaviorSubject<LibraryRecord> _editedRecordSubject = BehaviorSubject();
  Stream<LibraryRecord> get editedRecordStream => _editedRecordSubject.stream;

  LibraryRecord get currentEditedRecord => _editedRecordSubject.value;

  void initEditSubject(LibraryRecord record) {
    _editedRecordSubject.add(record ?? LibraryRecord());
  }

  void changeRecordType(RecordType type) {
    _editedRecordSubject.add(_editedRecordSubject.value..recordType = type);
  }

  void changeImage(String url) {
    _editedRecordSubject.add(_editedRecordSubject.value..imageUrl = url);
  }

  void changeTitle(String title) {
    _editedRecordSubject.value..title = title;
  }

  void changeAuthor(String author) {
    _editedRecordSubject.value..author = author;
  }

  void changeType(String type) {
    _editedRecordSubject.value..type = type;
  }

  void changePages(String pages) {
    _editedRecordSubject.value..numberOfPages = pages;
  }

  void changeLength(String length) {
    _editedRecordSubject.value..length = length;
  }

  void changeSeasons(String seasons) {
    _editedRecordSubject.value..seasons = seasons;
  }

  void changeMultiplayer(bool multiplayer) {
    _editedRecordSubject.value..multiplayer = multiplayer;
  }

  void changePlatform(String platform) {
    _editedRecordSubject.value..platform = platform;
  }

  @override
  void dispose() {
    super.dispose();
    _editedRecordSubject.close();
  }
}