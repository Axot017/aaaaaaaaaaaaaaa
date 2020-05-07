import 'package:aaaaaaaaaaaaaaa/enums/record_type.dart';
import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordTypeDropdown extends StatelessWidget {
  final void Function(RecordType) onChanged;
  RecordType value;

  RecordTypeDropdown({this.onChanged, this.value});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<RecordType>(
        hint: Text('Type'),
        onChanged: onChanged,
        value: value,
        items: [
          DropdownMenuItem<RecordType>(
            value: RecordType.MOVIE,
            child: SizedBox(child: Text('Movie')),
          ),
          DropdownMenuItem<RecordType>(
            value: RecordType.SERIES,
            child: Text('Series'),
          ),
          DropdownMenuItem<RecordType>(
            value: RecordType.GAME,
            child: Text('Game'),
          ),
          DropdownMenuItem<RecordType>(
            value: RecordType.BOOK,
            child: Text('Book'),
          ),
        ],
      ),
    );
  }

}