import 'package:alojibli/home.dart';
import 'package:alojibli/login.dart';
import 'package:alojibli/signin.dart';
import 'package:flutter/material.dart';
import 'otpverif.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home:Loading(),
     initialRoute:'/' ,
      routes:{
        '/':(context) => Home(),
        '/login':(context)=>Login(),
        '/signin':(context)=>Signin(),
        '/verif':(context) => Optverif(),
      },
    );
  }
}
