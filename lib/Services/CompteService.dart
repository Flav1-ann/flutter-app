import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import '../Domaine/Compte.dart';

class CompteService {

  Future<List<Compte>> FindAllCompte() async {
    var response = await http.get(
      Uri.parse("http://192.168.12.1:8099/compte-service/comptes"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
        'Access-Control-Allow-Headers':
          'Origin, X-Requested-With, Content-Type, Accept'
      },
    );
    List<Compte> comptes = [];

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var compteJson in jsonData["_embedded"]["comptes"]) {
        Compte compte = Compte(
            code: compteJson["code"],
            solde: compteJson["solde"],
            dateCreation: compteJson["dateCreation"],
            type: compteJson["type"]);
        comptes.add(compte);
        log(compte.toString());
      }
    }
    return comptes;
  }

  final String ip = "";
  final String port = "";
  DeleteCompte(int code) async {
    var response = await http.delete(
        Uri.parse("http://192.168.12.1:8099/compte-service/comptes/${code}"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
          'Access-Control-Allow-Headers':
              'Origin, X-Requested-With, Content-Type, Accept'
        });
  }

  AddAccount(Compte compte) async {
    var response = await http.post(
        Uri.parse("http://192.168.12.1:8099/compte-service/comptes"),
        headers: <String, String>{
          "Content-Type": "application/json; charset=utf-8",
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
          'Access-Control-Allow-Headers':
          'Origin, X-Requested-With, Content-Type, Accept'
        },body: jsonEncode(<String, dynamic>{
        "code": 401617428,
        "solde": 82016416.91132373,
        "dateCreation": "2016-05-27T00:12:49.902Z",
        "type": "COURANT"
    }));
  }
}
