import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String userId, String email) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
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


  // Método para carregar filtros do Firestore
  Future<void> carregarFiltrosDoFirestore() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('filtros').get();
      // Processar os dados dos filtros conforme necessário
    } catch (e) {
      print('Erro ao carregar filtros: $e');
    }
  }


  // Método para buscar dados de partidas
  Future<List<dynamic>> fetchMatchData() async {
    const url = 'https://pullebyte.onrender.com/matches-data';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load match data');
    }
  }
} 