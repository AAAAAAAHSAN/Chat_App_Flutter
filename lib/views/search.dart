import 'package:chat_app_flutter/services/database.dart';
import 'package:chat_app_flutter/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchTextEditingController = new TextEditingController();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((
        value) {
      setState(() {
        searchSnapshot = value;
      });
    });
  }

  Widget searchList() {
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SearchTile(
            userName: searchSnapshot.documents[index]["name"],
            userEmail: searchSnapshot.documents[index]['email'],
          );
        }) : Container();
  }

  @override
  void initState() {
    super.initState();
  }

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
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xffD800A0),
                                  const Color(0xffA3002F)
                                ]
                            ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        //padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.search,
                          color: Colors
                              .white,) //Image.asset("assets/images/search_white.png")
                    ),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  SearchTile({
    this.userName, this.userEmail
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,),
              Text(userEmail)
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12)
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text("Message"),
            ),
          )
        ],
      ),
    );
  }
}
