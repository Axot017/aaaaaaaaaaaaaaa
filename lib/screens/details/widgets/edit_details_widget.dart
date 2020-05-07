import 'package:aaaaaaaaaaaaaaa/blocs/library_item_details_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/enums/record_type.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/multiplayer_widget.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/record_type_dropdown.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/widgets/slider_picker.dart';
import 'package:aaaaaaaaaaaaaaa/utils/parsers.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/app_text_field.dart';
import 'package:flutter/material.dart';


class EditDetailsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditDetailsWidgetState();

}


class EditDetailsWidgetState extends State<EditDetailsWidget> {
  LibraryItemDetailsBloc _libraryItemDetailsBloc = AppModule.injector.getBloc();
  FocusNode _authorFocusNode = FocusNode();
  FocusNode _typeFocusNode = FocusNode();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _platformController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.value = TextEditingValue(text: _libraryItemDetailsBloc.currentEditedRecord.title ?? '');
    _authorController.value = TextEditingValue(text: _libraryItemDetailsBloc.currentEditedRecord.author ?? '');
    _typeController.value = TextEditingValue(text: _libraryItemDetailsBloc.currentEditedRecord.type ?? '');
    _platformController.value = TextEditingValue(text: _libraryItemDetailsBloc.currentEditedRecord.platform ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LibraryRecord>(
        stream: _libraryItemDetailsBloc.editedRecordStream,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              RecordTypeDropdown(
                value: snapshot.data?.recordType,
                onChanged: _libraryItemDetailsBloc.changeRecordType,
              ),
              SizedBox(height: 16,),
              AppTextField(
                label: 'Title',
                onSubmitted: (_) => FocusScope.of(context).requestFocus(_authorFocusNode),
                onChanged: _libraryItemDetailsBloc.changeTitle,
                controller: _titleController,
              ),
              SizedBox(height: 16,),
              AppTextField(
                label: snapshot.data?.authorLabel ?? 'Author',
                focusNode: _authorFocusNode,
                onSubmitted: (_) => FocusScope.of(context).requestFocus(_typeFocusNode),
                onChanged: _libraryItemDetailsBloc.changeAuthor,
                controller: _authorController,
              ),
              SizedBox(height: 16,),
              AppTextField(
                label: 'Type',
                focusNode: _typeFocusNode,
                onSubmitted: (_) => FocusScope.of(context).unfocus(),
                onChanged: _libraryItemDetailsBloc.changeType,
                controller: _typeController,
              ),
              ..._getWidgetsBasedOnType(snapshot.data),
            ],
          );
        }
    );
  }

  List<Widget> _getWidgetsBasedOnType(LibraryRecord record) {
    if (record == null) return [];
    if (record.recordType == RecordType.BOOK) {
      return [
        SizedBox(height: 16,),
        SliderPicker(
          key: ValueKey(record.recordType),
          title: 'Pages: ',
          onChange: _libraryItemDetailsBloc.changePages,
          valueParser: parseToPages,
          initValue: parseFromPages(_libraryItemDetailsBloc.currentEditedRecord.numberOfPages),
        )
      ];
    } else if (record.recordType == RecordType.GAME) {
      return [
        SizedBox(height: 16,),
        MultiplayerWidget(
          onChange: _libraryItemDetailsBloc.changeMultiplayer,
          initialData: _libraryItemDetailsBloc.currentEditedRecord.multiplayer,
        ),
        SizedBox(height: 16,),
        AppTextField(
          label: 'Platform',
          onSubmitted: (_) => FocusScope.of(context).requestFocus(_authorFocusNode),
          onChanged: _libraryItemDetailsBloc.changePlatform,
          controller: _platformController,
        ),
      ];
    } else if (record.recordType == RecordType.MOVIE) {
      return [
        SizedBox(height: 16,),
        SliderPicker(
          key: ValueKey(record.recordType),
          title: 'Length: ',
          onChange: _libraryItemDetailsBloc.changeLength,
          valueParser: parseToTime,
          initValue: parseFromTime(_libraryItemDetailsBloc.currentEditedRecord.length),
        )
      ];
    } else if (record.recordType == RecordType.SERIES) {
      return [
        SizedBox(height: 16,),
        SliderPicker(
          key: ValueKey(record.recordType),
          title: 'Seasons: ',
          onChange: _libraryItemDetailsBloc.changeSeasons,
          valueParser: parseToSeasons,
          initValue: parseFromSeasons(_libraryItemDetailsBloc.currentEditedRecord.seasons),
        )
      ];
    } else {
      return [];
    }
  }
}