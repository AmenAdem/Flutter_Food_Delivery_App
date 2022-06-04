

import 'package:alojibli/home.dart';
import 'package:alojibli/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();


 String? id   ; 
 late UserCredential user; 



 Future Message(String title,String msg,Color c)
{
  return showDialog(  
                        context: context,  
                        builder: (BuildContext context) {  
                          return AlertDialog(
                            title:Text(title) ,
                       alignment: Alignment.bottomCenter,
                       content: Container(
                         //color: Colors.red,
                         child:Text(msg,
                         style: TextStyle(
                           color: c,
                           fontSize: 16,
                           fontWeight:FontWeight.bold,
                                  ),
                                  ),
                                  ),
                               );  
                          },  
                      );
}


AlertDialog alert = AlertDialog(  
    title: Text("Simple Alert"),  
    content: Text("This is an alert message."),  
    actions: [  

    ],  
  );  

 

  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType,bool pass) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          
          obscureText: pass,
          cursorColor: Colors.amber,
          controller: userInput,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.amber,width:3)),
            hintText: hintTitle,
            hintStyle: const TextStyle(
              fontSize: 18, 
              color: Colors.grey, 
              fontStyle: FontStyle.italic),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.amber,width:3)),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: 200,
                margin: EdgeInsets.only(top: 100),
                //color: Colors.red,
                decoration: BoxDecoration(
                  image: DecorationImage(
                   image: AssetImage("assets/login.jpg"),)
                ),
                child: Text(""),
              ),
          Container(
            height: 510,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 45),
                  userInput(emailController, ' Email', TextInputType.emailAddress,false),
                  userInput(passwordController, ' Password', TextInputType.visiblePassword,true),
              Container(
                height: 55,
                // for an exact replicate, remove the padding.
                // pour une réplique exact, enlever le padding.
                padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  color: Colors.amber,
                  onPressed: () async{

                    // final prefs = await SharedPreferences.getInstance();    
                    // await prefs.setString('user', emailController.text); 
                    /*
                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      
                            );
                    } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      //Navigator.pushReplacement(context, new MaterialRou());
                        showDialog(  
                        context: context,  
                        builder: (BuildContext context) {  
                          return AlertDialog(
                            title:Text("check accout data! ") ,
                       alignment: Alignment.bottomCenter,
                       content: Container(
                         //color: Colors.red,
                         child:Text("The account already exists for that email.",
                         style: TextStyle(
                           color: Colors.red,
                           fontSize: 16,
                           fontWeight:FontWeight.bold,
                                  ),
                                  ),
                                  ),
                               );  
                          },  
                      );
                        
                    }
                    else{
                       final SharedPreferences shared=await SharedPreferences.getInstance();
                                shared.setString('ID',emailController.text);
                                                print(' \n \n \n local :::::: ${shared.getString('ID')}\n \n \n');
                                                // Get.off(Optverif()); 
                    Navigator.pushNamed(context, '/verif');
                    }
                    } catch (e) {
                    print(e);
                    }
                    */
                    try {
                      user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                       email: emailController.text,
                       password: passwordController.text
                     );
                   } on FirebaseAuthException catch (e) {
                     if (e.code == 'user-not-found') {
                       print('No user found for that email.');
                     } else if (e.code == 'wrong-password') {
                       print('Wrong password provided for that user.');
                     }
                   }
                   //if(user.)
                    //print(user);
                   if(user.user?.emailVerified==false)
                   {
                     Message("Email verification", "email not verified yet !! ", Colors.red);

                   }
                   else
                   {
                                final SharedPreferences shared=await SharedPreferences.getInstance();
                                shared.setString('ID',emailController.text);
                                   print(' \n \n \n local :::::: ${shared.getString('ID')}\n \n \n');
                                   Navigator.pushReplacement(
                                     context,
                                     new MaterialPageRoute(builder: (context)=>Home()),
                                      );
                   }
                  //  while(user.user?.emailVerified==false)
                  //  {
                  //     sleep(duration);
                  //  }
                   

                       final SharedPreferences shared=await SharedPreferences.getInstance();
                                shared.setString('ID',emailController.text);
                                   print(' \n \n \n local :::::: ${shared.getString('ID')}\n \n \n');
                    //                // Get.off(Optverif()); 
                    // Navigator.pushNamed(context, '/verif');
                    
                  },

                  child: const Text('se connecter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                  ),
                ),
                  const SizedBox(height: 20),
                  const Center(child: Text('Mot de passe oublié ?'),),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                  const Divider(thickness: 0, color: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Vous n \'avez pas de compte ?', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                            return Signin();
                        }
                        ),
                        );
                      },
                      child: const Text(
                        'Inscrivez-vous',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            ),
          ),
              ],
          ),
        ),
      ),
    );
  }
}
