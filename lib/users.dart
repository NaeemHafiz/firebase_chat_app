import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/chatscreen.dart';
import 'package:firebase_chat_app/constant.dart';
import 'package:firebase_chat_app/models/chat_model.dart';
import 'package:firebase_chat_app/models/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  var dbRef;
  List<Map<dynamic, dynamic>> lists = [];
  List<UserModel> UserList = [];

  User() {
    dbRef = FirebaseDatabase.instance.reference().child(Constant.USER_TABLE);
  }

  @override
  Widget build(BuildContext context) {
    // <1> Use StreamBuilder
    return StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, AsyncSnapshot<Event> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            DataSnapshot dataValues = snapshot.data.snapshot;
            UserModel userModel = UserModel.fromSnapshot(dataValues);
            var sss = UserModel.fromMap(dataValues);
            Map<dynamic, dynamic> values = dataValues.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return ListView.builder(
              shrinkWrap: true,
              itemCount: lists.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return buildItem(index, context);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
            // ignore: missing_return
          }
        });
  }

  Widget buildItem(int index, BuildContext buildContext) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          buildContext,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                lists[index]['UserName'] != null
                    ? lists[index]['UserName']
                    : "No Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 1.0,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
