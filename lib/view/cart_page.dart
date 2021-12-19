import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hring_task/view/widgets/cart_products.dart';
import 'package:hring_task/view/widgets/checkout_form.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  _cartScreenState createState() => _cartScreenState();
}
var da;
class _cartScreenState extends State<cartScreen> {
  int x = 0;
  num tot = 0;
  var currentUser;

  void hell() async {
    currentUser = FirebaseAuth.instance.currentUser;
    da = await FirebaseFirestore.instance
        .collection('cart')
        .doc('x')
        .collection("${currentUser.uid}")
        .get()
        .then((g) {
      x = g.size;
      int i = 0;
      tot = 0;
      while (i < x) {
        tot = tot + num.parse(g.docs[i].get("price")) * g.docs[i].get("quantity");
        i = i + 1;
      }
      print(g.docs[0].get("price"));

      setState(() {});
      print(x);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hell();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(
                flex: 7,
              ),
              Column(
                children: [
                  Text(
                    "Your Cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "$x items",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 10,
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('cart')
                .doc('x')
                .collection("${currentUser.uid}")
                .snapshots(),
            builder: (context, chatSnapshot) {
              // print(chatSnapshot.data.docs[0].id);
              if (chatSnapshot.data == Null)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (chatSnapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );

              return ListView.builder(
                reverse: false,
                itemCount: x,
                itemBuilder: (context, index) {
                  print(tot);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                        onDismissed: (direction) async {

                            x = x - 1;
                            tot = tot -
                                (num.parse(chatSnapshot.data!.docs[index].get('price')) *
                                    chatSnapshot.data!.docs[index]
                                        .get('quantity'));
                             await FirebaseFirestore.instance
                                .collection('cart')
                                .doc('x')
                                .collection("${currentUser.uid}")
                                .doc(chatSnapshot.data!.docs[index].id)
                                .delete();

                          setState(() {

                          });
                        },
                        direction: DismissDirection.endToStart,
                        key: Key(chatSnapshot.data!.docs[index].id),
                        background: Container(
                          decoration: BoxDecoration(
                              color: Colors.red[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Spacer(),
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        child: product(
                            chatSnapshot.data!.docs[index].get('address'),
                            chatSnapshot.data!.docs[index].get('name'),
                            chatSnapshot.data!.docs[index].get('price'),
                            chatSnapshot.data!.docs[index].get('quantity'))),
                  );
                },
              );
            }),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 175,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 20,
              color: Color(0xffdadada).withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.flag,
                    color: Colors.orange,
                  ),
                ),
                Spacer(),
                Text(
                  "Add voucher code",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total :\n",
                    style: TextStyle(color: Colors.grey[700]),
                    children: [
                      TextSpan(
                        text: "₹$tot",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.orange),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                          ),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18))),
                      onPressed: () {
                        showDialog(context: context,builder: (BuildContext context ){
                          return   checkoutForm();
                        });

                      },
                      child: Text("Check Out"),
                    )),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
