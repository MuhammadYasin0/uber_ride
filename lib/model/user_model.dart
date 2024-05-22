import 'package:uber_ride/repository/local/local_database.dart';

class UserModel{

  int uId;
  String uName;
  String uEmail;
  String uPass;
  String uPhoneNo;

  UserModel({
    required this.uId,
    required this.uName,
    required this.uEmail,
    required this.uPass,
    required this.uPhoneNo
    });

// Map to Model

factory UserModel.fromMap(Map<String, dynamic>map)=>UserModel(
  uId: map[AppDatabase.COLUMN_USER_ID], 
  uName: map[AppDatabase.COLUMN_USER_NAME], 
  uEmail: map[AppDatabase.COLUMN_USER_EMAIL], 
  uPass: map[AppDatabase.COLUMN_USER_PASS], 
  uPhoneNo: map[AppDatabase.COLUMN_USER_PHONENO]
  );



// Model to Map

Map<String, dynamic> toMap(){
  return{
    AppDatabase.COLUMN_USER_NAME: uName,
    AppDatabase.COLUMN_USER_EMAIL: uEmail,
    AppDatabase.COLUMN_USER_PASS: uPass,
    AppDatabase.COLUMN_USER_PHONENO: uPhoneNo,
  };
}
}


