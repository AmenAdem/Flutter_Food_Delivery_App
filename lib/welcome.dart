import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image:DecorationImage(image: AssetImage(
                      'assets/location3.png',
                    ),
                    ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Discover restaurants \n near you ",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    ) ,),
                  Text("\n\nAlo Jibli uses your Location to\n show restaurents  near \nyou! \n\n",
                   textAlign: TextAlign.center,
                   style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                  RaisedButton(      
                    padding: EdgeInsets.fromLTRB(60,15,60,15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Colors.amber,
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text('Allow Location Access', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                          ),
                          SizedBox(height: 30),
                ],
              ),
            ),
          ),
    );
  }
}