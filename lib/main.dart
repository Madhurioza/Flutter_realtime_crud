import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names


  @override
  Widget build(BuildContext context) {
    final DBRef = FirebaseDatabase.instance.reference();
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Firebase"),),
          body: Row(
            children: <Widget>[
              RaisedButton(
                  child: Text("Write"),
                   onPressed: (){
                     DBRef.child("1").set({
                       'id': 'ID1',
                       'data': "This is sample Data"
                     });
                      },
                      ),
              RaisedButton(
                child: Text("Read"),
                onPressed: (){
                  DBRef.once().then((DataSnapshot datasnapshot){
                    print(datasnapshot.value);
                  });
                },
              ),

              RaisedButton(
                child: Text("Update"),
                onPressed: (){
                  DBRef.child("1").update({
                    'data': "This is Updated value"
                  });
                },
              ),
              RaisedButton(
                child: Text("Delete"),
                onPressed: (){
                  DBRef.child("1").remove();
                },
              ),

                     ],
                     ),

        ),
    );
  }


  }



