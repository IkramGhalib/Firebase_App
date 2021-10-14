import 'package:firebase_app/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;

TextEditingController emailcontroller = TextEditingController();

TextEditingController passwordcontroller = TextEditingController();

String email = '', password = '';

final _formkey = GlobalKey<FormState>();

bool showSpinner =false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up Form'),
        ),
            body: Column(
              children: [
                Text("Form"),
                SizedBox(height: 20,),
                Form(
                  key: _formkey,
                    child: Column(
                    children: [
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefix: Icon(Icons.email),
                      ),
                      onChanged: (String value){
                        email = value;
                      },
                      validator: (value){
                        return value!.isEmpty ? "Enter the Email" :null;
                      },


                    ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordcontroller,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefix: Icon(Icons.lock),
                          border: OutlineInputBorder()
                        ),
                        onChanged: (String value){
                          password = value;
                        },
                        validator: (value){
                          return value!.isEmpty ? "Enter the Email" :null;
                        },


                      ),
                      SizedBox(height: 20,),
                      RoundButton(title: "Register", onPress: () async{
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            showSpinner =true;
                          });
                          try{
                            final user = await _auth.createUserWithEmailAndPassword(email:email.toString().trim(),password:password.toString().trim());
                            if(user!= null){
                              print("Success");
                              toastMassage("User Create");
                              setState(() {
                                showSpinner =false;
                              });
                            }

                          }
                          catch(e){
                            print(e.toString());
                            toastMassage(e.toString());
                            setState(() {
                              showSpinner =false;
                            });
                          }
                        }
                      })
                  ],
                ))
              ],

      ),

      ),
    );

  }
  void toastMassage(massage ) {
    Fluttertoast.showToast(
        msg: massage.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
