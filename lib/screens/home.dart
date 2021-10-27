import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'add_post.dart';
import 'login.dart';

class HomesScreen extends StatefulWidget {
  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
// FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              _auth.signOut().then((value) => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login())));
            },
            child: Icon(Icons.logout),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPost()));
            },
          )
        ],
      ),
    );
  }
}
