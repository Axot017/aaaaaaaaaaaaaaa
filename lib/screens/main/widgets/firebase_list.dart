import 'package:aaaaaaaaaaaaaaa/datasources/firebase.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/main/widgets/library_item_card.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomFirebaseList extends StatefulWidget {
  final String uid;
  final bool onlyViewed;
  final void Function(bool) changeFabVisibility;

  CustomFirebaseList({this.uid, this.onlyViewed, this.changeFabVisibility});

  @override
  State<StatefulWidget> createState() => CustomFirebaseListState();
}

class CustomFirebaseListState extends State<CustomFirebaseList> {
  final FirebaseUtil _firebaseUtil = AppModule.injector.get();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      defaultChild: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
      controller: _controller,
      padding: EdgeInsets.symmetric(vertical: 6.0),
      duration: AppAnimationInfo.LIST_ANIMATION_DURATION,
      query: _firebaseUtil.getQuery(widget.uid),
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(context, DataSnapshot snapshot, Animation<double> animation, int index) {
    final item = LibraryRecord.fromJson((snapshot.value as Map).map((key, value) => MapEntry(key as String, value)));
    if (item.viewed != widget.onlyViewed) return Container();
    return FadeTransition(
      opacity: animation,
      child: LibraryItemCard(
        recordKey: snapshot.key,
        item: item,
      ),
    );
  }

  void onScroll() {
    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      widget.changeFabVisibility(true);
    } else if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      widget.changeFabVisibility(false);
    }
  }
}