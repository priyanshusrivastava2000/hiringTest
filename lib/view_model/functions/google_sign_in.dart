
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hring_task/model/user_data.dart';
import 'package:hring_task/view/home_page.dart';
import 'package:hring_task/view_model/functions/transition_animation.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String?> signInWithGoogle(BuildContext context) async{
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser!.uid);
    await UserData(uid: user.uid).userData(user.displayName!, user.email!);
    Fluttertoast.showToast(msg: "LOGIN SUCCESSFUL",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,
      fontSize: 15.0,textColor: Colors.black,);
    Navigator.pop(context);
    Navigator.of(context).push(ScaleRoute(page: const homePage()));
    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}