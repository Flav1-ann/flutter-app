import 'package:first_app_flutter/Screens/AddCompte_screen.dart';
import 'package:first_app_flutter/Screens/Home_screen.dart';
import 'package:first_app_flutter/Screens/ListCompte_screen.dart';
import 'package:first_app_flutter/Screens/register_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  CompteScreen.routeName: (context) => CompteScreen(),
  AddCompte_screen.routeName: (context) => AddCompte_screen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
};
