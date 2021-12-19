import 'package:flutter/material.dart';

class product extends StatelessWidget {
  product(this.adr, this.nam, this.price, this.quant);
  var adr, nam;
  var price, quant;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("$adr"),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Text(
                "$nam",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),

              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text.rich(
              TextSpan(text: "₹$price", children: [
                TextSpan(
                  text: " x $quant",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ]),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            )
          ],
        ),
      ],
    );
  }
}