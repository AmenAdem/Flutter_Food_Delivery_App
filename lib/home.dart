import 'dart:async';
import 'package:alojibli/intro.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


String? id   ; 


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  {

  Future getvalidationdata()async{
    final SharedPreferences share =await SharedPreferences.getInstance();
    var obtaineid=share.getString('ID');
    setState(() {
      id=obtaineid; 
      print("hadhi l id " );
      print(id);
    });
  }

  //  getUser() async {
  //   final prefs = await SharedPreferences.getInstance();  
   
  //   var user=await prefs.getString("user"); 
  //   if(user!=null)
  //   {
  //     Navigator.pushReplacement(
  //       context,
  //        new MaterialPageRoute(
  //          builder: (context) => Login()
  //          )
  //          );//pushNamed(context, "/login");
  //   }
  //   else
  //   {
  //     print(user);
  //    // Navigator.pushNamed(context, "/verif");
     
  //  }
@override
void initState(){
    getvalidationdata().whenComplete(() async{
      //  Timer(Duration(seconds: 1),()=>Get.off(id==null?Login():Optverif() ) );
      if(id==null)
      {
      Navigator.pushReplacement(
        context,
         new MaterialPageRoute(
           builder: (context) => intro()
           )
           );
      }
      /*
      else
      Navigator.pushReplacement(
        context,
         new MaterialPageRoute(
           builder: (context) => Home()
           )
           )
           */
    });
    
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      
      appBar: AppBar( 
        backgroundColor: Colors.amber,
        title: Text("home"),
        actions: [
         
        ],
      ),
      drawer: Drawer(
        child: Column(
            children: [
              Container(
               
                alignment: Alignment.center,
                height: 200,
                color:Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                       decoration: BoxDecoration(
                      color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                      child: Icon(Icons.person)),

                  ],
                ),
              ),
              Container(child: Text("settings"),),
            ],
          ),
        ),
    );
  }
  
}
