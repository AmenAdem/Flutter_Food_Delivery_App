import 'package:alojibli/welcome.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>SafeArea(
    child:IntroductionScreen(
      pages: [
            PageViewModel(

             title: "Place your Order from the app ",
             bodyWidget: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
             
            ],),
           image:Container( margin:const EdgeInsets.only(top:100), child: const Image(image:AssetImage("assets/order.png"))),
            ),
            PageViewModel(
             title: "Our deliver will bring it for you ! ",
             bodyWidget: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
      
            ],),
            image:Container( margin:const EdgeInsets.only(top:100), child:const Image(image:AssetImage('assets/deliver.png'))),
            ),
            PageViewModel(
             title: "You can pay when you get your order ",
             bodyWidget: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [

            ],),
            image:Container( padding:const EdgeInsets.only(top:10  ), child:const Image(image:AssetImage('assets/pay4.png'))),
            ),
    
      ],
      onDone: (){
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
            builder:(context) =>  Welcome(),
            ),);
      },
      //showSkipButton: true,
      //skip: const Text("Skip"),
      done: const Text("Get Started ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amber),),
      next: const Text("next"),

    ),
  );
    
  
}