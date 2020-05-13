import 'package:aaaaaaaaaaaaaaa/models/movie.dart';
import 'package:aaaaaaaaaaaaaaa/models/search_response.dart';
import 'package:aaaaaaaaaaaaaaa/repositories/movies_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  MoviesRepository _moviesRepository;
  
  PublishSubject<String> _searchSubject = PublishSubject();
  Stream<SearchResponse> searchStream;
  
  PublishSubject<Movie> _movieSubject = PublishSubject();
  Stream<Movie> get movieStream => _movieSubject.stream;

  MoviesBloc(this._moviesRepository) {
    searchStream = _searchSubject
        .debounceTime(Duration(seconds: 1))
        .switchMap((query) => query != ''
        ? _moviesRepository.getPropositions(query).asStream()
        : Stream.fromIterable([SearchResponse(results: [])]));
  }

  Function(String query) get getPropositions => _searchSubject.add;
  
  void getMovie(String title) {
    _moviesRepository.getMovie(title)
        .then(_movieSubject.add)
        .catchError(_movieSubject.addError);
  }

  @override
  void dispose() {
    super.dispose();
    _searchSubject.close();
    _movieSubject.close();
  }
}