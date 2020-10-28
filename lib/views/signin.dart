import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20,),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "email"
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "password"
              ),
            ),
            SizedBox(height: 8,),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text("Forgot Password?", style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
