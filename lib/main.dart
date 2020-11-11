import 'package:chat_app_flutter/helper/authenticate.dart';
import 'package:chat_app_flutter/views/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xffF7D7F4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Authenticate(),
    );
  }
}
