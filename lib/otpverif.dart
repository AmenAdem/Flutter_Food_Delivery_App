import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Optverif extends StatelessWidget {

String num="+216123456789" ;
late TextEditingController pin1=new TextEditingController(text: ""); 
late TextEditingController pin2=new TextEditingController(text: ""); 
late TextEditingController pin3=new TextEditingController(text: ""); 
late TextEditingController pin4=new TextEditingController(text: "");  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
     backgroundColor:Colors.white,
      body: Container(  
        margin: EdgeInsets.only(top:60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Verification Code\n" ,
                textAlign: TextAlign.start,
                style:TextStyle(
                  color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    )
                      ), 
              Text("We have sent verification code to\n ",
              //textAlign: TextAlign.start,
                        style:TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold),
              ),
              ), 
                  Text(num,
                  style: TextStyle(color: Colors.black),), 
                  TextButton(onPressed: () => {},
                   child:Text("\nChange Phone Number\n"),
                   style:ButtonStyle(
                     foregroundColor: MaterialStateProperty.all(Colors.amber),
                     )
                     ), 
              Form(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:TextFormField(
                      autofocus: true,
                      controller: pin1,
                      onChanged: (value) {
                         if(value.length==1)
                         {
                           FocusScope.of(context).nextFocus();
                         }
                      },
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 250, 225, 148)),
                      borderRadius: BorderRadius.circular(15), 
                ),   
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.amber),
                  borderRadius: BorderRadius.circular(15),),
                     ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:TextFormField(
                      controller: pin2,
                       onChanged: (value) {
                         if(value.length==1)
                         {
                           FocusScope.of(context).nextFocus();
                         }
                      },
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 250, 225, 148)),
                      borderRadius: BorderRadius.circular(15),
                      
                ), 
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.amber),
                  borderRadius: BorderRadius.circular(15),),
                     ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:TextFormField(
                      controller: pin3,
                       onChanged: (value) {
                         if(value.length==1)
                         {
                           FocusScope.of(context).nextFocus();
                         }
                      },
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 250, 225, 148)),
                      borderRadius: BorderRadius.circular(15),
                ), 
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.amber),
                  borderRadius: BorderRadius.circular(15),),
                     ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    width: 64,
                    child:TextFormField(
                      controller:pin4 ,
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 250, 225, 148)),
                      borderRadius: BorderRadius.circular(15),
                ), 
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.amber),
                  borderRadius: BorderRadius.circular(15),),
                     ),
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  )
                ],
              )
             ),
             SizedBox(
               height: 30,
             ),
             Container(
               alignment: Alignment.bottomCenter,
               margin: EdgeInsets.only(bottom: 20),
              
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                        RaisedButton(      
                          
                          padding: EdgeInsets.fromLTRB(30,15,30,15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Colors.white,
                          onPressed: () {
                          },
                          child: const Text('Resend', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.amber,),),
                          ),

                        RaisedButton(     

                          padding: EdgeInsets.fromLTRB(30,15,30,15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          color: Colors.amber,
                          onPressed: () {
                            String s=pin1.text+pin2.text+pin3.text+pin4.text;
                            print(s);
                          },
                          child: const Text('Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white,),),
                          ),
                 ],
               ),
             ),
            ],

          ),
        ),
    ); 
  }
}
