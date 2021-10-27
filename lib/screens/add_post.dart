import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddPost extends StatefulWidget {

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController tileController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Posting"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextFormField(
                          controller: tileController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Title",
                              prefix: Icon(Icons.lock),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            return value!.isEmpty ? "Title Must Enter" : null;
                          },
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      minLines: 1,
                      maxLines: null,      
                      decoration: InputDecoration(
                          hintText: "Enter Description",
                          prefix: Icon(Icons.lock),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        return value!.isEmpty ? "Enter the Email" : null;
                      },
                    ),
                    SizedBox(height: 20.0,)
                    
                  ],
                ),
                    
                    
                

              ),
            )
            
          ],),
      ),
      
    );
  }
}