import 'package:aaaaaaaaaaaaaaa/repositories/auth_repository.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase {
  final AuthRepository _authRepository;

  BehaviorSubject<FirebaseUser> _currentUserSubject = BehaviorSubject();
  Stream<FirebaseUser> get currentUserStream => _currentUserSubject.stream.distinct((a, b) => a?.uid == b?.uid);

  AuthBloc(this._authRepository);

  FirebaseUser get currentUser => _currentUserSubject.value;

  tryAutoLogin() => _authRepository
      .getCurrentUser()
      .then(_currentUserSubject.add)
      .catchError(_currentUserSubject.addError);

  signIn(String email, String password) => _authRepository
      .signIn(email, password)
      .then(_currentUserSubject.add)
      .catchError(_currentUserSubject.addError);

  signUp(String email, String password) => _authRepository
      .signUp(email, password)
      .then(_currentUserSubject.add)
      .catchError(_currentUserSubject.addError);

  signOut() => _authRepository
      .signOut()
      .then((_) => _currentUserSubject.add(null))
      .catchError((_) => _currentUserSubject.add(null));

  @override
  void dispose() {
    super.dispose();
    _currentUserSubject.close();
  }
}