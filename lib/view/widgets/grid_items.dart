import 'package:flutter/material.dart';
import 'package:hring_task/view/product_page.dart';

class item extends StatelessWidget {
  item(this.address, this.name, this.price, this.id);
  var address, name;
  var id;
  var price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => productScreen(address, name, price, id)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage("$address"))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(
              "$name",
              style: TextStyle(color: Colors.grey[500],overflow: TextOverflow.ellipsis),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "₹$price",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "₹${double.parse(price) * 2}",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                      overflow: TextOverflow.ellipsis
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  "50% off",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                      overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}