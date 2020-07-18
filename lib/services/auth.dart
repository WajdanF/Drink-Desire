import 'package:firebase_auth/firebase_auth.dart';
import 'package:germaway/models/user.dart';
import 'package:germaway/services/database.dart';

class AuthService{
//Creating user obj based on Firebase user
User _userFromFirebaseUser (FirebaseUser user){
    return user != null ? User(uid: user.uid) :null;
}

//Auth change user stream
Stream<User> get user{
return _auth.onAuthStateChanged
//.map((FirebaseUser user) => _userFromFirebaseUser(user))
.map(_userFromFirebaseUser); //same as the one above
} 
//Sign in annon

final FirebaseAuth _auth = FirebaseAuth.instance;
Future signInAnon() async{
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }

  catch(e){
    print(e);
    return null;  
    }
}

//Sign in Email+Passowrd
Future signInEmailPassword(String email, String password) async{
try{
AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);  
FirebaseUser user = result.user;
return _userFromFirebaseUser(user);
}
catch(e){
  print(e);
  return null;
}
}
//Register in Email+Password
Future registerEmailPassword(String email, String password) async{
try{
AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);  
FirebaseUser user = result.user;
await DataBaseService(uid:user.uid).updateUserData('0','new memeber',100);
return _userFromFirebaseUser(user);
}
catch(e){
  print(e);
  return null;
}
}
//Sign out
Future signOut() async{
  try{
    return await _auth.signOut();
  } 
  catch(e){
    print(e);
      
    return null;
  }
}
}