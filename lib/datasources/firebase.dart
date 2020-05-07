import 'dart:io';

import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseUtil {
  final _dbReference = FirebaseDatabase.instance.reference().child('library').reference();
  final _storageReference = FirebaseStorage().ref();

  Query getQuery(String uid) => _dbReference.orderByChild('uid').equalTo(uid);

  Stream<LibraryRecord> getItemObservable(String key) => _dbReference.onChildChanged
      .where((event) => event.snapshot.key == key)
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => LibraryRecord.fromJson(event));

  updateItem(String key, LibraryRecord value) => _dbReference.update({
    key: value.toJson
  });

  addItem(LibraryRecord item) => _dbReference.push().update(item.toJson);

  removeItem(String key) => _dbReference.child(key).remove();

  StorageUploadTask sendImageToStorage(File file) => _storageReference
      .child(Uuid().v4())
      .putFile(file);
}