import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                        decoration: InputDecoration(
                          hintText: "search username",

                        ),
                      )
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors:[
                            const Color(0xffD800A0),
                            const Color(0xffA3002F)
                          ]
                        ),
                        borderRadius: BorderRadius.circular(40)
                      ),
                      //padding: EdgeInsets.all(4),
                      child: Icon(
                          Icons.search,
                      color: Colors.white,) //Image.asset("assets/images/search_white.png")
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
