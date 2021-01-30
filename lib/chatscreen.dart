import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final ScrollController listScrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  var dbRef;
  List<Map<dynamic, dynamic>> lists = [];

  ChatScreen() {
    dbRef = FirebaseDatabase.instance.reference().child("Chat");
  }
  @override
  Widget build(BuildContext context) {
    // <1> Use StreamBuilder
    // <1> Use StreamBuilder
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Messages"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder(
                stream: dbRef.onValue,
                builder: (context, AsyncSnapshot<Event> snapshot) {
                  if (snapshot.hasData) {
                    lists.clear();
                    DataSnapshot dataValues = snapshot.data.snapshot;
                    Map<dynamic, dynamic> values = dataValues.value;
                    values.forEach((key, values) {
                      lists.add(values);
                    });
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: lists.length,
                      scrollDirection: Axis.vertical,
                      controller: listScrollController,
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
                }),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: TextFormField(
                cursorColor: Colors.black,
                validator: (value) =>
                value.isEmpty ? 'Message cannot be blank' : null,
                controller: textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter a Message...'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: FlatButton(
                child: Text("Send Message"),
                onPressed: () {
                  sendMessage();
                  textEditingController.text = "";
                },
                textColor: Colors.white,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
      int index,BuildContext buildContext) {
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
                lists[index]['Message'] != null
                    ? lists[index]['Message']
                    : "No Data",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Divider(
            //   height: 1.0,
            //   color: Colors.black,
            // )
          ],
        ),
      ),
    );
  }

  Widget sendMessage() {
    dbRef.push()
        .set({"Message": textEditingController.text});
  }
}
