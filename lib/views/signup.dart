import 'package:chat_app_flutter/views/signin.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20,),
        child: Column(
          children: [
            TextField(
              controller: userNameTextEditingController,
              decoration: InputDecoration(
                  hintText: "Username"
              ),
            ),
            TextField(
              controller: emailTextEditingController,
              decoration: InputDecoration(
                  hintText: "email"
              ),
            ),
            TextField(
              controller: passwordTextEditingController,
              decoration: InputDecoration(
                  hintText: "password"
              ),
            ),
            SizedBox(height: 16,),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text("Forgot Password?", style: TextStyle(
                  fontSize: 16,
                ),
                ),
              ),

            ),
            SizedBox(height: 16,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffD800A0),
                      const Color(0xffA300BF)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text("Sign Up", style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),),
            ),
            SizedBox(height: 8,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                // we can also give just color without gradient
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff00ff1f),
                      const Color(0xff008e10)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Text("Sign Up with Google", style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
              ),),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new SignIn()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  Text("Sign In Now !",style: TextStyle(color: Colors.blue),),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
