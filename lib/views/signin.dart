import 'package:chat_app_flutter/views/signup.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal:24,),

            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                  child: Text("Sign In", style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),),
                ),
                SizedBox(height: 8,),
                InkWell(

                  child: Container(

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
                    child: Text("Sign In with Google", style: TextStyle(
                        fontSize: 16,
                      color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Register now!",style: TextStyle(color: Colors.blue),)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
