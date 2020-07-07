import 'package:germaway/models/user.dart';
import 'package:germaway/screens/authenticate/register.dart';
import 'package:germaway/screens/authenticate/sign_in.dart';
import 'package:germaway/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:germaway/services/auth.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
        home:Wrapper(),
        routes: 
        {
          '/register': (context) => Register(),
          '/sign_in': (context) => SignIn(),

        },
      ),
    );
  }
}