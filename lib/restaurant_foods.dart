import 'package:alojibli/restaurant.dart';
import 'package:flutter/cupertino.dart';

restaurant ?res; 
class Restaurantsfood extends StatefulWidget {

 Restaurantsfood(restaurant aux)
 {
  res=aux; 
 }

  @override
  State<Restaurantsfood> createState() => _RestaurantsfoodState();
}

class _RestaurantsfoodState extends State<Restaurantsfood> {
  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Text("${res?.name}"),
              //Text("${res?.location}"),
              //Text("${res?.phone1}"
                  ],
    );
  }
}