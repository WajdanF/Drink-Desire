import 'package:flutter/material.dart';
import 'package:germaway/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      )),
        title: Text('Allergy App'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person), 
            
            onPressed: ()async{
              await _auth.signOut();
              },
            label: Text('Logout'),
            )
        ],
      
      ),
      body: Container(),
    );
  }
}