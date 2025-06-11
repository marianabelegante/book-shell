import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // .obs torna a variável reativa. O GetX vai reconstruir os widgets que a usam.
  final Rxn<User> _user = Rxn<User>();

  // Getter para acessar o usuário fora do controller
  User? get user => _user.value;

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Liga o stream de autenticação à nossa variável reativa _user
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorMessage.value = _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorMessage.value = _handleAuthError(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Nenhum usuário encontrado com este e-mail.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'email-already-in-use':
        return 'Este e-mail já está em uso.';
      case 'weak-password':
        return 'A senha precisa ter no mínimo 6 caracteres.';
      default:
        return 'Ocorreu um erro. Tente novamente.';
    }
  }
}
