import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> addUser(String userId, String email) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection('users').doc(userId).get();
      if (!snapshot.exists) {
        await _firestore.collection('users').doc(userId).set({
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });
      } else {
        print('Usuário já existe no Firestore');
      }
    } catch (e) {
      print('Erro ao adicionar usuário: $e');
    }
  }

  // Método para autenticação
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Erro ao fazer login: $e');
      return null;
    }
  }

  // Método para cadastro
  Future<User?> registerWithEmailAndPassword(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      // Adicione o nome de usuário ao perfil do usuário
      await user?.updateDisplayName(username);
      await user?.reload();
      user = _auth.currentUser;

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
