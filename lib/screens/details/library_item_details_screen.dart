import 'package:aaaaaaaaaaaaaaa/datasources/firebase.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/library_item_details_content.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class LibraryItemDetailsScreen extends StatelessWidget {
  final String recordKey;
  final LibraryRecord item;

  LibraryItemDetailsScreen({this.recordKey, this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: getGradientAppBar(title: item != null ? 'Details' : 'Add',
          actions: _getAppbarActions(context),
        ),
        body: LibraryItemDetailsContent(
          item: item,
          recordKey: recordKey,
        ),
      ),
    );
  }

  List<Widget> _getAppbarActions(context) => [
    IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Na pewno?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Nie'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Tak'),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  final FirebaseUtil _firebaseUtil = AppModule.injector.get();
                  _firebaseUtil.removeItem(recordKey);
                },
              ),
            ],
          )
        );

      },
    )
  ];

}