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
  String ProfileImgUrl ="https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"; 
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
              Expanded(
                flex: 1,
                child: Container(
                 
                  alignment: Alignment.center,
                  //height: 200,
                 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child:
                      Container(
                        alignment: Alignment.center,
                         decoration: BoxDecoration(

                           image:DecorationImage(
                             image: 
                            NetworkImage(
                            ProfileImgUrl,
                            ),
                            //fit: BoxFit.fill,
                           ) ,
                        // color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(""),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Expanded(
                flex: 3,
                child: Container(
                child: Text("settings"),
                alignment: Alignment.center,
              color: Colors.amber,)),
            ],
          ),
        ),
    );
  }
  
}
