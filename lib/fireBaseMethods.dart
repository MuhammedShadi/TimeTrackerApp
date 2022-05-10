import 'package:firebase_auth/firebase_auth.dart';

class FireBaseMethods{
  Future<void> signInAnonymously() async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      print("${userCredentials.user?.uid}");
    }catch(error){
      print(error.toString());
    }
  }
}