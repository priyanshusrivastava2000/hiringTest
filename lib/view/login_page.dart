import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hring_task/view_model/functions/google_sign_in.dart';

class loginScreen extends StatefulWidget{
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.orange])
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children:  [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/test_logo.jpg'))
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white
                  ),
                  child: TextButton(
                    onPressed: (){
                      try{
                        signInWithGoogle(context);
                      }
                      catch(e)
                      {
                        print(e);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.1,
                          decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/glogo.png'))
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          child: const Text("Sign in with Google",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24,color: Colors.black),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}