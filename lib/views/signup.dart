import 'package:chat_app_flutter/views/signin.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate())
      {

      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
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
                          return "this will not work";
                        },
                        controller: userNameTextEditingController,
                        decoration: InputDecoration(
                            hintText: "Username"
                        ),
                      ),
                      TextFormField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                            hintText: "email"
                        ),
                      ),
                      TextFormField(
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
        ),
      ),

    );
  }
}
