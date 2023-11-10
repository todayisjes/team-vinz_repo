import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future logIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future logOut() async {
    await _auth.signOut();
    // ignore: avoid_print
    print("Log Out");
  }
}