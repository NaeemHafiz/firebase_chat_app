import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class Stream2Controller extends GetxController {
  StreamController<int> streamController;

  @override
  void onInit() {
    streamController = StreamController<int>();
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    Stream<DocumentSnapshot> doc =
        FirebaseFirestore.instance.collection('Chat').doc("1234").snapshots();
    doc.listen((event) {
      // streamController.sink.add(event.data("x"));
    });
    // TODO: implement onInit
    super.onInit();
  }

  void startStream() {
    Stream<DocumentSnapshot> stream;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    streamController.close();
    super.onClose();
  }
}
