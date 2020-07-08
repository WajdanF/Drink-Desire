import 'package:flutter/material.dart';
import 'package:germaway/models/user.dart';
import 'package:germaway/screens/authenticate/authenticate.dart';
import 'package:germaway/screens/home/home.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user ==null? Authenticate(): Home();
  }
}