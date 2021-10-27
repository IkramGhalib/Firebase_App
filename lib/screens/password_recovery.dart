import 'package:firebase_app/components/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class RecoveryPassword extends StatefulWidget {
  

  @override
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
 
FirebaseAuth _auth = FirebaseAuth.instance;
TextEditingController emailcontroller = TextEditingController();
// TextEditingController passwordcontroller = TextEditingController();
String email = '', password = '';
final _formkey = GlobalKey<FormState>();
bool showSpinner =false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recovery Password'),
        ),
            body: Column(
              children: [
                Text("Recovery"),
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
                      
                      RoundButton(title: "Recovery Password", onPress: () async{
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            showSpinner =true;
                          });
                          try{
                            _auth.sendPasswordResetEmail(email: emailcontroller.text.toString()).then((value) {
                              setState(() {
                                showSpinner =false;
                                });
                                toastMassage("Email Has been send to Reset password");
                                }).onError((e, stackTrace) {
                                  toastMassage(e.toString());
                                  });
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