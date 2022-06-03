import 'package:alojibli/home.dart';
import 'package:alojibli/login.dart';
import 'package:alojibli/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'otpverif.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
