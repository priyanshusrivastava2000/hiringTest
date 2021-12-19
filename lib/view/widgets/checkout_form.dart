import 'package:flutter/material.dart';

class checkoutForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<checkoutForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Dialog(

        child: Wrap(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.account_balance_outlined),
                  hintText: 'Enter your address',
                  labelText: 'Address',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: TextButton(

                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:Colors.orange,
                    ),
                    child: Center(child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),))),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}