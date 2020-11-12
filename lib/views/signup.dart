import 'package:chat_app_flutter/services/auth.dart';
import 'package:chat_app_flutter/services/database.dart';
import 'package:chat_app_flutter/views/chatRoomScreen.dart';
import 'package:chat_app_flutter/views/signin.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  testMethod()
  {

  }
  signMeUp(){
    if(formKey.currentState.validate())
      {
        Map<String, String> userInfoMap = {
          "name": userNameTextEditingController.text,
          "email" : emailTextEditingController.text,
        };

        setState(() {
          isLoading =true;
        });
        authMethods.signUpWithEmailAndPassword(emailTextEditingController.text,
            passwordTextEditingController.text).then((value) {
              //print("${value.uid}");


          databaseMethods.uploadUserInfo(userInfoMap);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context)=> ChatRoom(),
              ));
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ): SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: EdgeInsets.symmetric(horizontal:24,),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length< 4 ? "Please provide a valid username": null;
                        },
                        controller: userNameTextEditingController,
                        decoration: InputDecoration(
                            hintText: "Username"
                        ),
                      ),
                      TextFormField(
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter a valid email";
                        },
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                            hintText: "email"
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator:  (val){
                          return val.length < 6 ? "Enter Password 6+ characters" : null;
                        },
                        controller: passwordTextEditingController,
                        decoration: InputDecoration(
                            hintText: "password"
                        ),
                      )
                    ],
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
                GestureDetector(
                  onTap: (){
                    signMeUp();
                  },
                  child: Container(
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
                ),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: (){

                  },
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
                    child: Text("Sign Up with Google", style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Sign In Now !",style: TextStyle(color: Colors.blue),)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
