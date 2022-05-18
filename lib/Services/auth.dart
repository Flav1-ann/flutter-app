import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class AuthService {
  Future<String> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          {
            return "Adresse mail invalide";
          }
        case "email-already-in-use":
          {
            return "Adresse email déjà utilisée";
          }
        case "operation-not-allowed":
          {
            return "Opération interdite";
          }
        case "weak-password":
          {
            return "mot de passe trop faible";
          }
        default:
          {
            return "veuillez remplir les champs";
          }
      }
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "";
    } on FirebaseAuthException catch (e) {
      developer.log("error ${e.code}");
      switch (e.code) {
        case "invalid-email":
          {
            return "Adresse mail invalide";
          }
        case "user-disabled":
          {
            return "Utilisateur désactivé";
          }
        case "user-not-found":
          {
            return "L'utilisateur n'existe pas";
          }
        case "wrong-password":
          {
            return "mot de passe incorrect";
          }
        default:
          {
            return "veuillez remplir les champs";
          }
      }
    }
  }
}
