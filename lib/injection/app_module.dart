import 'package:aaaaaaaaaaaaaaa/api/movies_api_provider.dart';
import 'package:aaaaaaaaaaaaaaa/application.dart';
import 'package:aaaaaaaaaaaaaaa/auth/auth.dart';
import 'package:aaaaaaaaaaaaaaa/blocs/auth_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/blocs/library_item_details_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/blocs/movies_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/datasources/firebase.dart';
import 'package:aaaaaaaaaaaaaaa/repositories/auth_repository.dart';
import 'package:aaaaaaaaaaaaaaa/repositories/movies_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AppModule extends ModuleWidget {

  @override
  List<Bloc> get blocs => [
    Bloc((i) => AuthBloc(i.get())),
    Bloc((_) => LibraryItemDetailsBloc()),
    Bloc((i) => MoviesBloc(i.get()))
  ];

  @override
  List<Dependency> get dependencies => [
    Dependency((_) => Auth()),
    Dependency((i) => AuthRepository(i.get())),
    Dependency((_) => FirebaseUtil()),
    Dependency((_) => MoviesApiProvider(Dio())),
    Dependency((i) => MoviesRepository(i.get())),
  ];

  @override
  Widget get view => Application();

  static Inject get injector => Inject<AppModule>.of();
}