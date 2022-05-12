import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStatChange();

  Future<User?> signInAnonymously();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;

  @override
  User? get currentUser => _fireBaseAuth.currentUser;

  @override
  Stream<User?> authStatChange() => _fireBaseAuth.authStateChanges();

  @override
  Future<User?> signInAnonymously() async {
    try {
      final userCredentials = await _fireBaseAuth.signInAnonymously();
      print("${userCredentials.user?.uid}");
      return userCredentials.user;
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _fireBaseAuth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
