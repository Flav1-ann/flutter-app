import 'package:first_app_flutter/Domaine/Compte.dart';
import 'package:first_app_flutter/Services/CompteService.dart';
import 'package:flutter/material.dart';

class AddCompte_screen extends StatelessWidget{
  static String routeName = "/addCompte";
  final SoldeController = TextEditingController();

  String _selectedItemCategory = "";
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: const Text("Ajout d'un compte"),
    ),
    body:  Center(
        child: Column(
          children: [
            buildFormField("Solde",TextInputType.number,SoldeController,false),
            DropdownButton<String>(
              items: <String>[
                'EPARGNE',
                'COURANT'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
              },
              hint : Text(_selectedItemCategory),
              style: TextStyle(
                color: Colors.black,
              ),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
            ),
            TextButton(
                onPressed: () {
                 // CompteService.AddAccount(Compte(code: 1, solde: 123, dateCreation: null, type: "COURANT"));
                },
                child: const Text('Ajouter'))
          ],
        ))
  );

  TextFormField buildFormField( String labelText,TextInputType keyboardType,TextEditingController controller,bool readOnly) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: (value) {
      },
      readOnly:readOnly ,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}