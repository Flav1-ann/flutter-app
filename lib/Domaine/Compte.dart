import 'dart:convert';
import 'dart:ffi';

Compte compteDomainJson(String str) => Compte.fromJson(json.decode(str));

String compteDomainToJson(Compte compte) =>
    json.encode(compte.toJson());

class Compte {

  int code;
  double solde;
  String dateCreation;
  String type;
  Compte({
     required this.code,
     required this.solde,
     required this.dateCreation,
      required this.type
  });

  int get Code => this.code;
  double get Solde => this.solde;
  String get DateCreation => this.dateCreation;

  factory Compte.fromJson(Map<String, dynamic> json) => Compte(
      code: json['code'],
      solde: json['solde'] as double,
      dateCreation: json['dateCreation'],
      type: json['type']
  );

  Map<String, dynamic> toJson() =>
      {
        "code": code,
        "solde": solde,
        "dateCreation": dateCreation,
      };

  @override
  String toString() {
    return 'Compte{code: $code, solde: $solde, dateCreation: $dateCreation}';
  }
}