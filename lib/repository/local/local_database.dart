import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uber_ride/model/user_model.dart';

class AppDatabase{

  AppDatabase._();

  static final AppDatabase db =AppDatabase._();


  static const String USER_TABLE = "user_table";
  static const String COLUMN_USER_ID = "user_id";
  static const String COLUMN_USER_NAME = "user_name";
  static const String COLUMN_USER_EMAIL = "user_email";
  static const String COLUMN_USER_PASS = "user_pass";
  static const String COLUMN_USER_PHONENO = "user_phoneno";

 Database? myDb;

 //login pref key
 static final String LOGIN_ID = "uId";

 Future<Database>getDb() async{
    if(myDb!= null){
      return myDb!;
    }else{
   myDb = await initDb();
   return myDb!;
    }

 }

  Future<Database>initDb() async{

   var rootPath = await getApplicationDocumentsDirectory();
   var actualPath = join(rootPath.path, "userDb.db");

   return await openDatabase(actualPath, version: 1, onCreate: (db, version){

  db.execute("Create table $USER_TABLE ($COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text, $COLUMN_USER_EMAIL text unique, $COLUMN_USER_PASS text, $COLUMN_USER_PHONENO text)");


   } );
 }


 //*******  Queries for User *******

//addNew user
  Future<bool> addNewUser(UserModel newUser) async{
    var db = await getDb();
    bool haveAccount = await checkIfEmailAlreadyExists(newUser.uEmail);
    bool accCreated = false;
    if(!haveAccount){
      var rowsEffected = await db.insert(USER_TABLE, newUser.toMap());
      accCreated = rowsEffected>0;
    }
    return accCreated;
  
  } 

 // User check email
  Future<bool> checkIfEmailAlreadyExists(String email) async{
  var db = await getDb();
  
  var mData = await db.query(USER_TABLE, where: "$COLUMN_USER_EMAIL =?" , whereArgs: [email]);

   return mData.isNotEmpty;
  }

  
  // User login
  Future<bool> authenticateUser(String email, String pass) async{
    var db = await getDb();

    var mData = await db.query(USER_TABLE, where: "$COLUMN_USER_EMAIL=? AND $COLUMN_USER_PASS=?", whereArgs: [email,pass] );
    
    if(mData.isNotEmpty){
      setUID(UserModel.fromMap(mData[0]).uId);
    }
    return mData.isNotEmpty;
  }

  // get UID
  Future<int> getUID() async{
    var prefs = await SharedPreferences.getInstance();
   return prefs.getInt("UID")!;
  }

  // set UID
  void setUID(int uId) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt("UID", uId);
  }
}