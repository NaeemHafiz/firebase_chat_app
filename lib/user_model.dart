import 'package:firebase/firebase.dart';

class UserModel {
  String ContactNumber;
  String Country;
  String Email;
  String FirstName;
  String LastName;
  String Password;
  int TimeZoneId;
  String UserName;
  String key;

  UserModel();

  // UserModel.fromSnapshot(DataSnapshot snapshot)
  //     : key = snapshot.key,
  //       ContactNumber = snapshot.value['ContactNumber'] ?? '',
  //       Country = snapshot.value['Country'] ?? '',
  //       Email = snapshot.value['Email'] ?? '',
  //       FirstName = snapshot.value['FirstName'] ?? '',
  //       LastName = snapshot.value['LastName'] ?? '',
  //       TimeZoneId = snapshot.value['TimeZoneId'] ?? 0,
  //       UserName = snapshot.value['UserName'] ?? '',
  //       Password = snapshot.value['Password'] ?? '';
  //
  // toJson() {
  //   return {
  //     "ContactNumber": ContactNumber,
  //     "Country": Country,
  //     "Email": Email,
  //     "FirstName": FirstName,
  //     "LastName": LastName,
  //     "TimeZoneId": TimeZoneId,
  //     "Password": Password,
  //     "UserName": UserName,
  //   };
  // }
}
