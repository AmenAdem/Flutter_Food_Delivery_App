
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signin extends StatefulWidget {
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

late UserCredential user; 
 String? id   ; 

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
                
                    try {
                       user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      Message("Password","The password provided is too weak." , Colors.red);
                    } else if (e.code == 'email-already-in-use') {
                      Message("exists","The account already exists for that email." , Colors.red);
                      print('The account already exists for that email.'); 
                    }
                    } catch (e) {
                    print(e);
                    }

                    

                    // await FirebaseAuth.instance.verifyPhoneNumber(
                    //    phoneNumber: '+216 25 33 33 19',
                    //    verificationCompleted: (PhoneAuthCredential credential) {},
                    //    verificationFailed: (FirebaseAuthException e) {},
                    //    codeSent: (String verificationId, int? resendToken) {},
                    //    codeAutoRetrievalTimeout: (String verificationId) {},
                    //    );
                    
                      /*

                                                            final user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                                      // Name, email address, and profile photo URL
                                        final name = user.displayName;
                                    final email = user.email;
                                final photoUrl = user.photoURL;

                                    // Check if user's email is verified
                                      final emailVerified = user.emailVerified;

                                          // The user's ID, unique to the Firebase project. Do NOT use this value to
                                            // authenticate with your backend server, if you have one. Use
                                                    // User.getIdToken() instead.
                                                  final uid = user.uid;
                                            }
                                            await user?.sendEmailVerification();
                                            Navigator.push(context,
                                             MaterialPageRoute(
                                               builder:((context) {
                                                 return Optverif();
                                               } 
                                               ),
                                               ),);
                    }
                    */
                       },
                       child: const Text('Sign In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                       ),
                     ),
                       Padding(
                         padding: const EdgeInsets.only(top: 25.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         ),
                       ),
                       const Divider(thickness: 0, color: Colors.white),
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
