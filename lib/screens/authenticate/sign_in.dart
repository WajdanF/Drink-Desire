import 'package:flutter/material.dart';
import 'package:germaway/models/constants.dart';
import 'package:germaway/models/loading.dart';
import 'package:germaway/screens/authenticate/register.dart';
import 'package:germaway/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
    final _formkey = GlobalKey<FormState>();
  //Text Field State  
  String email;
  String password;
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],

      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10)
        )),
        backgroundColor: Colors.brown[400],
        title: Text('Sign In'),
        elevation: 0,
        
      ),
      body: GestureDetector(
        onTap: () {
        FocusScope.of(context).unfocus();
        },
              child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
  
          child: Form(
            key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Enter Email':null,
              onChanged: (val){
                setState(() {
                  email = val;
                });
              },

            ),
            SizedBox(height: 30,),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: 'Enter Password',
                labelText: 'Passowrd'
              ),
              style:TextStyle(
                fontSize: 14
              ),
              validator: (val) => val.isEmpty ? 'Enter Password':null,
              obscureText: true,
              onChanged: (val){ 
                 setState(() {
                  password = val;
                });
              },
            ),
            SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 InkWell(
                    child: new Text('Register?',
                    style: TextStyle(
                      color: Colors.red
                    ),),
                    onTap: (){
                    widget.toggleView();
                    },
            ),
               ],
             ),
             SizedBox(height: 10,),
            Center(
              child: RaisedButton(

                 shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
                onPressed: () async{
                FocusScope.of(context).unfocus();
                if(_formkey.currentState.validate()){ 
                  setState(()=> loading = true);
                 dynamic result = await _auth.signInEmailPassword(email,password);
                  if (result ==null){
                    setState(()=>loading = false);
                    setState(() => error = 'Account account does not exist or information is wrong');
                  }
                }
                
                },
                child: Text('Sign In',
                style: TextStyle(
                  color: Colors.white
                ),),
                color: Colors.pink[500],
                
              ),
            ),
             SizedBox(height:10),
            Center(
              child: Text(
                error,
                style:TextStyle(
                  color: Colors.red,
                  fontSize: 15
                )
              
              )
            ),
            
            ],
          ),
          ),

          // Sign in Anon
          // RaisedButton(

          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10))
          // ),
          //   onPressed: () async{
              
          //     dynamic result = await _auth.signInAnon();
          //     if (result == null){
          //       print('error singing in');
          //     }
          //     else{
          //       print('Signed In');
          //       print(result.uid);
          //     }
          //     },
            
          //   child: Text('sign in Anon')
          // )
        ),
      ),
    ); 
    }
}