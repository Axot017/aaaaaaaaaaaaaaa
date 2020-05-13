import 'dart:async';
import 'dart:io';

import 'package:aaaaaaaaaaaaaaa/blocs/auth_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/blocs/library_item_details_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/datasources/firebase.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/edit_details_widget.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/item_details_header.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/library_details_widget.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/utils/toast_util.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/floating_gradient_icon_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LibraryItemDetailsContent extends StatefulWidget {
  final String recordKey;
  final LibraryRecord item;

  LibraryItemDetailsContent({this.recordKey, this.item});

  @override
  State<StatefulWidget> createState() => LibraryItemDetailsContentState();
}

class LibraryItemDetailsContentState extends State<LibraryItemDetailsContent> {
  FirebaseUtil _firebaseUtil = AppModule.injector.get();
  AuthBloc _authBloc = AppModule.injector.getBloc();
  LibraryItemDetailsBloc _libraryItemDetailsBloc;
  StreamSubscription _currentRecordSubscription;
  LibraryRecord currentRecordState;
  bool _isInEditMode = false;
  File _selectedImage;

  @override
  void initState() {
    super.initState();
    _isInEditMode = widget.item == null;
    _libraryItemDetailsBloc = AppModule.injector.getBloc();
    _libraryItemDetailsBloc.initEditSubject(widget.item);
    _currentRecordSubscription = _libraryItemDetailsBloc.editedRecordStream.listen((record) {
      setState(() => currentRecordState = record);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<LibraryRecord>(
          stream: _firebaseUtil.getItemObservable(widget.recordKey),
          initialData: widget.item,
          builder: (context, snapshot) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 54),
              child: Column(
                children: <Widget>[
                  Card(
                    child: SizedBox(
                      height: 256,
                      child: ItemDetailsHeader(
                        onImageClick: _selectImage,
                        imageFile: _selectedImage,
                        icon: currentRecordState?.icon ?? snapshot.data?.icon ?? Icons.edit,
                        imageUrl: currentRecordState?.imageUrl ?? snapshot.data?.imageUrl ?? '',
                        iconHeroTag: '${widget.recordKey}icon',
                        imageHeroTag: '${widget.recordKey}image',
                        isInEditMode: _isInEditMode,
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  AnimatedSwitcher(
                    layoutBuilder: (Widget currentChild, List<Widget> previousChildren) {
                      return Stack(
                        children: <Widget>[
                          ...previousChildren,
                          if (currentChild != null) currentChild,
                        ],
                        alignment: Alignment.topCenter,
                      );
                    },
                    duration: AppAnimationInfo.BASE_ANIMATION_DURATION,
                    child: Card(
                      key: ValueKey(_isInEditMode),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: !_isInEditMode ? LibraryDetailsWidget(
                          recordKey: widget.recordKey,
                          item: snapshot.data,
                        ) : EditDetailsWidget(),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        ),
        AnimatedAlign(
          alignment: _isInEditMode ? Alignment.bottomLeft : Alignment.bottomRight,
          duration: AppAnimationInfo.BASE_ANIMATION_DURATION,
          curve: AppAnimationInfo.BASE_ANIMATION_CURVE,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingGradientIconButton(
              icon: _isInEditMode ? Icons.save : Icons.edit,
              onClick: _onSave,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _currentRecordSubscription.cancel();
  }
  
  void _selectImage() {
    ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _selectedImage = image;
      });
    });
  }

  void _onSave() {
    if (_isInEditMode) {
      _onEdit();
    } else {
      setState(() {
        _isInEditMode = true;
      });
    }
  }

  void _onEdit() {
    if (_libraryItemDetailsBloc.currentEditedRecord.recordType == null) {
      showErrorToast("Please select type");
      return;
    } else if (_libraryItemDetailsBloc.currentEditedRecord.title == null || _libraryItemDetailsBloc.currentEditedRecord.title.isEmpty) {
      showErrorToast("Please select title");
      return;
    }

    if (_selectedImage != null) {
      _loadImageAndSaveData();
    } else {
      _saveData(null);
    }
  }

  void _saveData(String url) {
    if (url != null) {
      Navigator.of(context).pop();
      _libraryItemDetailsBloc.currentEditedRecord.imageUrl = url;
    }
    if(widget.item == null) {
      _firebaseUtil.addItem(
          _libraryItemDetailsBloc.currentEditedRecord
            ..uid = _authBloc.currentUser.uid
            ..viewed = false
      );
      Navigator.of(context).pop();
    } else {
      _firebaseUtil.updateItem(widget.recordKey, _libraryItemDetailsBloc.currentEditedRecord..nullUnnecessaryFields());
      setState(() {
        _isInEditMode = false;
      });
    }

  }

  void _loadImageAndSaveData() {
    final progress = _firebaseUtil.sendImageToStorage(_selectedImage);
    showDialog(
      barrierDismissible: false,
      context: context,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: StreamBuilder<StorageTaskEvent>(
            stream: progress.events,
            builder: (context, snapshot) {
              return LinearProgressIndicator(
                value: (snapshot.data?.snapshot?.bytesTransferred ?? 0) / (snapshot.data?.snapshot?.totalByteCount ?? 100),
              );
            },
          ),
        ),
      )
    );
    progress.onComplete.then((result) async => _saveData(await result.ref.getDownloadURL()));
  }
}