import 'package:firebase_database/firebase_database.dart';

class ChatModel {
  DateTime Date;
  bool IsRead;
  String Message;
  String Optional;
  String ReceiverId;
  String ReceiverName;
  int SenderId;
  String SenderName;
  String key;

  ChatModel();

  ChatModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        Message = snapshot.value['Message'] ?? '',
        Optional = snapshot.value['Optional'] ?? '',
        ReceiverId = snapshot.value['ReceiverId'] ?? '',
        ReceiverName = snapshot.value['ReceiverName'] ?? '',
        SenderId = snapshot.value['SenderId'] ?? '',
        SenderName = snapshot.value['SenderName'] ?? 0,
        Date = snapshot.value['Date'] ?? '',
        IsRead = snapshot.value['IsRead'] ?? '';


  toJson() {
    return {
      "Message": Message,
      "Optional": Optional,
      "ReceiverId": ReceiverId,
      "ReceiverName": ReceiverName,
      "SenderId": SenderId,
      "SenderName": SenderName,
      "Date": Date,
      "IsRead": IsRead,
    };
  }
}
