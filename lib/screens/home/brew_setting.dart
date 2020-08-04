import 'package:flutter/material.dart';
import 'package:germaway/models/constants.dart';
import 'package:germaway/models/user.dart';
import 'package:germaway/services/database.dart';
import 'package:provider/provider.dart';


class Brew_Setting extends StatefulWidget {
  @override
  _Brew_SettingState createState() => _Brew_SettingState();
}

class _Brew_SettingState extends State<Brew_Setting> {
    final _formkey = GlobalKey<FormState>();
    
    String _currentName;
    String _currentSugar;
    int _currentStrength;
    List <String> sugars = ['0','1','2','3','4'];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DataBaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        return GestureDetector(
            onTap: () {
            FocusScope.of(context).unfocus();
            },
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  
            child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),  
                
                Text("Settings",
                style: TextStyle(
                  fontSize: 18
                ),),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Enter a name',
                    labelText: 'Name',
                  ),
                  validator: (val) => val.isNotEmpty ? 'Please enter a name': null,
                  onChanged: (val) => setState(()  => _currentName = val),
                ),  
                SizedBox(height: 20,),

                DropdownButtonFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Sugars",
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    hintText: null
                  ),
                  value:_currentSugar ?? '0',
                  items: sugars.map((sugar){ 
                     return DropdownMenuItem(value: sugar,child:Text('$sugar sugars'));
                  }).toList(),
                  validator: (val) => val.isNotEmpty ? 'Please select a sugar amount': null,
                  onChanged: (val)=>setState(()=>_currentSugar = val)),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 60,),
                      CircleAvatar(
                        backgroundColor: Colors.brown[_currentStrength],
                      ),
                      Slider(
                      activeColor: Colors.brown[_currentStrength ?? 100],  
                      inactiveColor: Colors.brown[_currentStrength ?? 100],
                      value: (_currentStrength ?? 100).toDouble(),  
                      min: 100,
                      max:900,
                      divisions: 8,
                    onChanged: (val)=> setState(() =>_currentStrength=val.round())),
                    ]
                  ),
                 RaisedButton(

                     shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
                    onPressed: () async{
                    FocusScope.of(context).unfocus();
                    if(_formkey.currentState.validate()){ 
                    
                    }
                    
                    },
                    child: Text('Update',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                    color: Colors.pink[500],
                    
                  ),
                
              ],
            )
            ),
          ),
        );
      }
    );
  }
}