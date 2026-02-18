
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User> login(String nome) async {
    final result = await _auth.signInAnonymously();
    await result.user?.updateDisplayName(nome);
    return result.user!;
  }

  User? get currentUser => _auth.currentUser;
}