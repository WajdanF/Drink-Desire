import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:germaway/models/user.dart';

class DataBaseService{

  final String uid;
  DataBaseService({this.uid});
  //collection reference
  final CollectionReference restrictionCollection = Firestore.instance.collection('Restrictions');

  Future updateUserData(String sugar, String name, int strength) async{
    return await restrictionCollection.document(uid).setData(
      {
        'sugar': sugar,
        'name': name,
        'strength': strength
      }
    );
  }
  //Get brews strem
  Stream<QuerySnapshot> get brews{
    return restrictionCollection.snapshots();
  }

}