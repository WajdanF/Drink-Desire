import 'package:flutter/material.dart';
import 'package:germaway/models/constants.dart';
import 'package:germaway/models/loading.dart';
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
        if (snapshot.hasData){
          UserData userData = snapshot.data;
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
                
                Text("Settings",
                style: TextStyle(
                  fontSize: 18
                ),),
                SizedBox(height: 20,),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Enter a name',
                    labelText: 'Name',
                  ),
                  validator: (val) => val.isEmpty ? 'Please enter a name': null,
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
                  value:_currentSugar ?? userData.sugar,
                  items: sugars.map((sugar){ 
                     return DropdownMenuItem(value: sugar,child:Text('$sugar sugars'));
                  }).toList(),
                  onChanged: (val)=>setState(()=>_currentSugar = val)),
                  SizedBox(height: 20,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 60,),
                      CircleAvatar(
                        backgroundColor: Colors.brown[_currentStrength ?? userData.strength],
                        backgroundImage: AssetImage('Assets/coffee_icon.png'),
                        radius: 30.0 ,
                      ),
                      Slider(
                      activeColor: Colors.brown[_currentStrength ?? userData.strength],  
                      inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                      value: (_currentStrength ?? userData.strength).toDouble(),  
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
                      if (_formkey.currentState.validate()){ 
                    await DataBaseService(uid:user.uid).updateUserData(
                      _currentSugar ?? userData.sugar, _currentName ?? userData.sugar, _currentStrength ?? userData.strength); 
                    }
                    
                      Navigator.pop(context);
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
        else{
          return Loading();
        }
      }
    );
  }
}