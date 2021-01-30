import 'package:firebase_chat_app/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true, // this is all you need
          title: Text("Users"),
        ),
        backgroundColor: Colors.green,
        body: User(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
