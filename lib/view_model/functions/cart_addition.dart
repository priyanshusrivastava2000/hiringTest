import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void trysubmit(name,price,quantity,address,id) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('cart')
        .doc("x")
        .collection("${currentUser!.uid}")
        .doc("${id}")
        .set({
      'address':address,
      'name': name,
      'price': price,
      "quantity": quantity,
    });
    print("DOne");
  }