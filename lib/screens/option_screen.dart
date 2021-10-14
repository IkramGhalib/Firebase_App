import 'package:firebase_app/components/round_button.dart';
import 'package:firebase_app/screens/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';



class OptionScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundButton(title: "Login", onPress: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
          );
              }),
              SizedBox(height: 20,),
              RoundButton(title: "Register", onPress: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()),
          );})
            ],),
        ),
      ),
      
    );
  }
}