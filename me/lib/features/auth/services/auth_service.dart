import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._(); // private constructor
  static final AuthService instance = AuthService._();

  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential?> createAccount({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> changeUsername({required String username}) async {
    await _auth.currentUser?.updateDisplayName(username);
  }

  Future<void> changePassword({required String password}) async {
    await _auth.currentUser?.updatePassword(password);
  }

  Future<void> signOut() async => await _auth.signOut();
}
