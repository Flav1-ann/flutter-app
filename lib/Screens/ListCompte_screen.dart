import 'package:first_app_flutter/Screens/AddCompte_screen.dart';
import 'package:first_app_flutter/Screens/Home_screen.dart';
import 'package:flutter/material.dart';

import '../Domaine/Compte.dart';
import '../Services/CompteService.dart';

class CompteScreen extends StatelessWidget {
  static String routeName = "/comptes";

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      body: BodyCompte(),
    );
  }
}

class BodyCompte extends StatefulWidget {
  @override
  _BodyCompteState createState() => _BodyCompteState();
}

class _BodyCompteState extends State<BodyCompte> {
  int _selectedIndex = 0;
  var snapshot;

  Map<int, String> routes = {
    0: LoginScreen.routeName,
    1: CompteScreen.routeName,
    2: AddCompte_screen.routeName,
  };
  Future<List<Compte>> comptes = CompteService().FindAllCompte();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushNamed(context, routes![index].toString());
    print(_selectedIndex);
  }

  Widget _dialogBuilder(BuildContext context, Compte compte) {
    return SimpleDialog(
      children: [
        SizedBox(
            width: 200.0,
            height: 150.0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "code: ${compte.code}",
                  ),
                  Text(
                    "solde: ${compte.solde}€",
                  ),
                  Text(
                    "type: ${compte.type}",
                  ),
                  Text(
                    "Date de création: ${compte.dateCreation}",
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    Compte compte = snapshot.data![index];
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, compte)),
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "code: ${compte.code}",
                    ),
                    Text(
                      "solde: ${compte.solde}€",
                    ),
                    Text(
                      "type: ${compte.type}",
                    ),
                    Text(
                      "Date de création: ${compte.dateCreation}",
                    ),
                    TextButton(
                        onPressed: () {
                          CompteService().DeleteCompte(compte.code);
                          UpdateListeAccount();
                        },
                        child: const Text('Supprimer')),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des comptes"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add Account',
            onPressed: () {
              //CompteService().AddAccount();
              UpdateListeAccount();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          UpdateListeAccount();
          return Future.value(false);
        },
        child: Center(
            child: FutureBuilder<List<Compte>>(
                future: comptes,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        this.snapshot = snapshot;
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: _listItemBuilder,
                        );
                      }
                    // return _buildGridViewItem(context, snapshot.data);
                  }
                })),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.money), label: "Liste Des Comptes"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Création d'un compte",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  void UpdateListeAccount() {
    setState(() {
      comptes = CompteService().FindAllCompte();
    });
  }
}
