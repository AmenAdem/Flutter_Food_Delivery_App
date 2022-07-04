import 'dart:async';
import 'package:alojibli/intro.dart';
import 'package:alojibli/restaurant.dart';
import 'package:alojibli/restaurant_foods.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


String? id   ; 
List resList = []; 
String ProfileImgUrl ="https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"; 

CollectionReference restaurants = FirebaseFirestore.instance.collection('restaurants');

Future<List> getData() async{

 resList = []; 
  CollectionReference restaurants = FirebaseFirestore.instance.collection('restaurants');
  await restaurants.get().then((value){
    value.docs.forEach((element) { 
      resList.add(element.data());
             }
            );
       }
    );
    
  return resList; 
}



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
      // print("hadhi l id " );
      // print(id);
    });
  }






@override
void initState(){
    getvalidationdata().whenComplete(() async{
    
      if(id==null)
      {
      Navigator.pushReplacement(
        context,
         new MaterialPageRoute(
           builder: (context) => intro()
           )
           );
      }
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
      
        body:
                    FutureBuilder(
                    future:getData(),
                       builder: (context,snapshot){        
                    if(snapshot.connectionState==ConnectionState.waiting)
                    {
        
                        return Center(
                          heightFactor: 10,
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                          ),
                    );
                    }
        
                    if(snapshot.hasData)
                    {
                      
                      return ListView.builder(
                        
                         scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        itemCount: resList.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: (){
                              print(index);
                             Navigator.push(
                              context,MaterialPageRoute(
                              builder: ((context) {
                               return Restaurantsfood(new restaurant(resList[index]));
                             }
                             ),
                             ),
                             );

                            },
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                          
                                Container( 
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                    alignment: Alignment.bottomLeft,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color:Colors.grey,
                                          blurRadius: 12,
                                          ),
                                      ],
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("${resList[index]['image']}"
                                        )
                                        ,)
                                        ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(9.9,0, 9.9,0),
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.only(left: 10),
                                                color: Colors.white.withOpacity(1),
                                                child:Text("${resList[index]['name']}",
                                        style: TextStyle(
                                          fontSize: 25,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),),
                                              ),
                              ],
                            ),
                          );                
        
                          
                          
                    
        
        
        
                        } ,
                        );
                    }
                    return Text("error");  //  error Widget 
                    }
                  ),
    );
  }
  
}
