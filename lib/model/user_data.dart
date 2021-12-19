import 'package:cloud_firestore/cloud_firestore.dart';

class UserData{
  String uid;
  dynamic data;
  UserData({required this.uid});
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');
  Future userData(String fullname, String email) async{
    try{
      await users.doc(uid).set({
        'name': fullname,
        'email': email,

      });
    }
    catch(e){
      print(e);
    }
  }
}