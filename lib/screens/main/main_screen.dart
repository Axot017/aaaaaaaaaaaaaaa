import 'dart:async';

import 'package:aaaaaaaaaaaaaaa/blocs/auth_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/enums/record_type.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/models/library_record.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/auth_screen.dart';
import 'package:aaaaaaaaaaaaaaa/screens/details/library_item_details_screen.dart';
import 'package:aaaaaaaaaaaaaaa/screens/main/widgets/background_with_bottom_wave.dart';
import 'package:aaaaaaaaaaaaaaa/screens/main/widgets/firebase_list.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/gradient_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => MainScreenState();

}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  StreamSubscription _logoutSubscription;
  AuthBloc _authBloc;
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();

    _authBloc = AppModule.injector.getBloc();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => _changeFabVisibility(true));
    _logoutSubscription = _authBloc.currentUserStream.listen(logout);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getGradientAppBar(title: 'Library', tabBar: _getTabBar, actions: _appbarActions),
      body: BackgroundWithFab(
        isFabVisible: _isFabVisible,
        onFabClick: _onFabClick,
        child: StreamBuilder<FirebaseUser>(
          stream: _authBloc.currentUserStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TabBarView(
                controller: _tabController,
                children: <Widget>[
                  CustomFirebaseList(
                    uid: snapshot.data.uid,
                    onlyViewed: false,
                    changeFabVisibility: _changeFabVisibility,
                  ),
                  CustomFirebaseList(
                    uid: snapshot.data.uid,
                    onlyViewed: true,
                    changeFabVisibility: _changeFabVisibility,
                  )
                ],
              );
            } else {
              return Container();
            }
          }
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _logoutSubscription.cancel();
  }

  List<Widget> get _appbarActions => [
    IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: _authBloc.signOut,
    )
  ];

  PreferredSizeWidget get _getTabBar => TabBar(
    controller: _tabController,
    indicatorColor: Colors.white,
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.ondemand_video),
      ),
      Tab(
        icon: Icon(Icons.history),
      ),
    ],
  );

  void _onFabClick() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LibraryItemDetailsScreen()));
  }

  void _changeFabVisibility(bool visibility) {
    if(visibility == _isFabVisible) return;
    setState(() {
      _isFabVisible = visibility;
    });
  }
  
  void logout(FirebaseUser currentUser) {
    if(currentUser == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AuthScreen()));
    }
  }
}

final testObject = LibraryRecord(
  uid: 'eq87pqXfgNPIvkdTvxz9oRFpffI2',
  title: 'Test',
  imageUrl: 'https://static.posters.cz/image/750webp/73514.webp',
  recordType: RecordType.MOVIE,
  viewed: true,
  score: 1,
  author: 'Chuj'
);