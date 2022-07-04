

import 'package:cloud_firestore/cloud_firestore.dart';

class restaurant{
String? id;
String? name;
String? image; 
GeoPoint? location; 
String? phone1; 
String? phone2; 



restaurant(Map<String,dynamic> a)
{
  this.image=a["image"];
  this.phone2=a["phone2"];
  this.phone1=a["phone1"];
  this.location=a["location"];
  this.name=a["name"];
}



}
