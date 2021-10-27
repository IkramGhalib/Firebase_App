import 'package:firebase_app/components/round_button.dart';
import 'package:firebase_app/screens/password_recovery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String email = '', password = '';
  final _formkey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          children: [
            Text("Form"),
            SizedBox(
              height: 20,
            ),
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
                      onChanged: (String value) {
                        email = value;
                      },
                      validator: (value) {
                        return value!.isEmpty ? "Enter the Email" : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefix: Icon(Icons.lock),
                          border: OutlineInputBorder()),
                      onChanged: (String value) {
                        password = value;
                      },
                      validator: (value) {
                        return value!.isEmpty ? "Enter the Email" : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                        title: "Login",
                        onPress: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: emailcontroller.toString().trim(),
                                      password:
                                          passwordcontroller.toString().trim());
                              if (user != null) {
                                print("Success");
                                toastMassage("User Create");
                                setState(() {
                                  showSpinner = false;
                                });
                              }
                            } catch (e) {
                              print(e.toString());
                              toastMassage(e.toString());
                              setState(() {
                                showSpinner = false;
                              });
                            }
                          }
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundButton(
                        title: "Recovery Password",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RecoveryPassword()));
                                  
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void toastMassage(massage) {
    Fluttertoast.showToast(
        msg: massage.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
