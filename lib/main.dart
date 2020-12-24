import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:vivian_flutter_app/HomePage.dart';
import 'package:vivian_flutter_app/LoginPage.dart';
import 'package:vivian_flutter_app/RegistrationPage.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(vivianFlutterAapp());
}

class vivianFlutterAapp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: "Vivian Flutter App",

        home: LoginPage(),
    );
  }
}




