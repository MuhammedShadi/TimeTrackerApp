import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User? get currentUser;

  Stream<User?> authStatChange();

  Future<User?> signInAnonymously();

  Future<User?> signInGoogle();

  Future<User?> signInWithFacebook();

  Future<UserCredential> loginWithFacebook();

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
    return null;
  }

  @override
  Future<User?> signInGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _fireBaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          code: "Error_MISSING_GOOGLE_ID_TOKEN",
          message: "Sign in aborted by user",
        );
      }
    } else {
      throw FirebaseAuthException(
        code: "Error_Aborted_By_User",
        message: "Sign in aborted by user",
      );
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken;
        final userCredential = await _fireBaseAuth.signInWithCredential(
            FacebookAuthProvider.credential(accessToken!.token));
        return userCredential.user;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
          code: "Error_Aborted_By_User",
          message: "Sign in aborted by user",
        );
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: "Error_FACEBOOK_LOGIN_FAILD",
          message: response.error?.developerMessage,
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  Future<UserCredential> loginWithFacebook() async {
    final fbLoginRes = await FacebookAuth.instance.login();
    final userData = await FacebookAuth.instance.getUserData();

    final facebookAuthCredentials =
        FacebookAuthProvider.credential(fbLoginRes.accessToken!.token);
    await _fireBaseAuth.signInWithCredential(facebookAuthCredentials);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredentials);
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    final facebookLogin = FacebookLogin();
    try {
      await googleSignIn.signOut();
      await facebookLogin.logOut();
      await _fireBaseAuth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
