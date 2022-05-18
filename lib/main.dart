import 'package:firebase_core/firebase_core.dart';
import 'package:first_app_flutter/Screens/Home_screen.dart';
import 'package:first_app_flutter/Screens/ListCompte_screen.dart';
import 'package:first_app_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'Domaine/Compte.dart';
import 'Services/CompteService.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: LoginScreen.routeName,
      routes: routes,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   int _selectedIndex = 0;
//   var snapshot ;
//   Future<List<Compte>> comptes = CompteService().FindAllCompte();
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   Widget _dialogBuilder(BuildContext context, Compte compte){
//     return SimpleDialog(
//       children: [
//         SizedBox(width: 200.0,height: 150.0,
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Text("code: ${compte.code}",),
//               Text("solde: ${compte.solde}€",),
//               Text("type: ${compte.type}",),
//               Text("Date de création: ${compte.dateCreation}",),
//             ],
//           ),
//         ))
//       ],
//     );
//   }
//
//   Widget _listItemBuilder(BuildContext context, int index){
//     Compte compte = snapshot.data![index];
//     return GestureDetector(
//       onTap: ()=> showDialog(context: context, builder: (context) =>
//       _dialogBuilder(context,compte)
//       ),
//       child:Column(
//         children: <Widget>[
//           Container(
//               padding: const EdgeInsets.all(15),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Text("code: ${compte.code}",),
//                     Text("solde: ${compte.solde}€",),
//                     Text("type: ${compte.type}",),
//                     Text("Date de création: ${compte.dateCreation}",),
//                     TextButton(onPressed: () {
//                       CompteService().DeleteCompte(compte.code);
//                       UpdateListeAccount();
//                     }, child: const Text('Supprimer')),
//
//                   ],
//                 ),
//               )
//           )
//         ],
//       ) ,
//     );
//   }
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(title: const Text("Liste des comptes"),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.add),
//               tooltip: 'Add Account',
//               onPressed: () {
//                 CompteService().AddAccount();
//                 UpdateListeAccount();
//               },
//             ),
//           ],
//         ),
//         body: RefreshIndicator(
//           onRefresh: () {
//             UpdateListeAccount();
//             return Future.value(false);
//           },
//           child: Center(
//               child: FutureBuilder<List<Compte>>(
//                   future: comptes,
//                   builder: (context, snapshot) {
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.none:
//                       case ConnectionState.waiting:
//                         return const CircularProgressIndicator();
//                       default:
//                         if (snapshot.hasError) {
//                           return Text('Error: ${snapshot.error}');
//                         } else {
//                           this.snapshot = snapshot;
//                           return ListView.builder(
//                             itemCount: snapshot.data?.length,
//                             itemBuilder: _listItemBuilder,
//                           );
//                         }
//                     // return _buildGridViewItem(context, snapshot.data);
//                     }
//                   })),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.money),
//                 label: "Liste Des Comptes"
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add),
//               label: "Création d'un compte",
//             ),
//
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.red,
//           onTap: _onItemTapped,
//         ),
//       );
//     }
//   void UpdateListeAccount(){
//     setState((){
//       comptes = CompteService().FindAllCompte();
//     });
//   }
//   }
//
