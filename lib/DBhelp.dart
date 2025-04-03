import 'package:guestsurvey/const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  DbHelper._instance();
  static final DbHelper helper= DbHelper._instance();

  Future<String> getDBpath()async{

    String dbpath= await getDatabasesPath();
    return join(dbpath,DBname);
  }

  Future<Database>getDbInstanse()async{
    String path=await getDBpath();
   return openDatabase(path,version: dbversion,onCreate: (db,dbversion)=>_oncreate(db));
  }

  _oncreate(Database db) {

String SQl ='CREATE TABLE $Tablename ( $colid INTEGER PRIMARY KEY AUTOINCREMENT, $colname TEXT, $colemail TEXT, '
    ' $colroomnumber TEXT, $colcommentm TEXT, $colcommentR TEXT, $colcomments TEXT,$colstay TEXT,$colphone TEXT,'
    '$colrate INTEGER,$colmeet INTEGER, $coldate TEXT)';
db.execute(SQl);

  }


}