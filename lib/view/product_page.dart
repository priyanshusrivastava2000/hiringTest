import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hring_task/view/cart_page.dart';
import 'package:hring_task/view_model/functions/cart_addition.dart';

class productScreen extends StatefulWidget {
  productScreen(this.address, this.name, this.price, this.id);
  var address, name;
  var price, id;

  @override
  _productScreenState createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  int item = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            iconSize: 40,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cartScreen()));
                }),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(
                          "${widget.address}",
                        ),
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Card(
                          margin: EdgeInsets.all(0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          elevation: 10.0,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.name}",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.orange[700],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0),
                                        child: Text(
                                          "₹${widget.price}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0),
                                        child: Text(
                                          "₹${double.parse(widget.price) * 2}",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 0),
                                        child: Text(
                                          "50% off",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),



                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 32,
                                        child: OutlineButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          onPressed: () {
                                            if (item > 1)
                                              setState(() {
                                                item = item - 1;
                                              });
                                          },
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        item.toString().padLeft(2, "0"),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: 40,
                                        height: 32,
                                        child: OutlineButton(
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              item = item + 1;
                                            });
                                          },
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.orange),
                                        ),
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.add_shopping_cart,
                                              color: Colors.orange,
                                            ),
                                            onPressed: () {
                                             trysubmit(widget.name,widget.price,item,widget.address,widget.id);
                                             Fluttertoast.showToast(msg: "Item added to cart",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,
                                               fontSize: 15.0,textColor: Colors.black,);
                                            }),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 50,
                                          child: FlatButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                            ),
                                            onPressed: () {
                                              trysubmit(widget.name,widget.price,item,widget.address,widget.id);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => cartScreen()),
                                             );
                                            },
                                            color: Colors.orange,
                                            child: Text(
                                              "Buy Now".toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
