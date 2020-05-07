import 'package:aaaaaaaaaaaaaaa/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Auth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  Future<FirebaseUser> signIn(String email, String password) => _firebaseAuth.signIn(email, password);

  Future<FirebaseUser> signUp(String email, String password) => _firebaseAuth.signUp(email, password);

  Future<FirebaseUser> getCurrentUser() => _firebaseAuth.getCurrentUser();

  Future signOut() => _firebaseAuth.signOut();

  Future sendVerificationEmail() => _firebaseAuth.sendVerificationEmail();

  Future<bool> isEmailValidated() => _firebaseAuth.isEmailValidated();
}