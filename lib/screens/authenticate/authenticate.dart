import 'package:flutter/material.dart';
import 'package:germaway/screens/authenticate/register.dart';
import 'package:germaway/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState((){
      showSignIn =! showSignIn;
    });
  }
  @override   
  Widget build(BuildContext context) {
  
    return showSignIn == true ? SignIn(toggleView: toggleView):Register(toggleView: toggleView);
  }
}