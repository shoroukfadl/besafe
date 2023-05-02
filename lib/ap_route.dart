import 'package:besafe/presentation/screens/defultinapp/edit_profile.dart';
import 'package:besafe/presentation/screens/welcome_login/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
switch( settings.name){
  case '/':
  return MaterialPageRoute(builder: (_) => WelcomePage());
}

  }
}