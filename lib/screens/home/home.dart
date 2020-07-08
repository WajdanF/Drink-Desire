import 'package:flutter/material.dart';
import 'package:germaway/models/brew.dart';
import 'package:germaway/screens/home/brew_list.dart';
import 'package:germaway/services/auth.dart';
import 'package:germaway/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DataBaseService().brews,
          child: Scaffold(
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
        body: BrewList(), 
      ),
    );
  }
}