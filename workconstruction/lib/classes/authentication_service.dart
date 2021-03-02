import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Future<String> signIn({String phonenumber}) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phonenumber);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String phonenumber}) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(phoneNumber: phonenumber);
      return "Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
}
