import 'package:guestsurvey/DBhelp.dart';
import 'package:guestsurvey/const.dart';
import 'package:guestsurvey/sests.dart';
import 'package:sqflite/sqflite.dart';

class GUST{

  GUST._instanse();
  static final GUST gust =GUST._instanse();
  Database? _DB;
  init() async {

  _DB= await  DbHelper.helper.getDbInstanse();
  }

 Future<List<Survey>> query()async{
    if(_DB==null){
      _DB= await  DbHelper.helper.getDbInstanse();
    }
    print(_DB==null);
    List<Map<String,dynamic>> mapDAta=await _DB!.query(Tablename,orderBy: '$coldate DESC');
    return mapDAta.map((e) => Survey.fromMap(e)).toList();
 }

  Future<List<Survey>> queryrate()async{
    List<Map<String,dynamic>> mapDAta=await _DB!.query
      (Tablename,where: '$colrate = ? OR $colrate = ?',whereArgs: [10,9],orderBy: '$coldate DESC' );
 return mapDAta.map((e) => Survey.fromMap(e)).toList();
  }
  Future<int>insert(Survey survey)async{

  return await  _DB!.insert(Tablename, survey.toMap());

  }
  Future<int>Delete(int ID)async{
   return await _DB!.delete(Tablename,where: '$colid = ?',whereArgs: [ID]);
  }
  Future<int> updateSurvey(Survey note) async {

    return await _DB!.update(Tablename, note.toMap(),where: '$colid = ?',whereArgs: [note.id]);

  }

  Future<List<Survey>> getexcel(String Day)async{
    List<Map<String,dynamic>> mapDAta=await _DB!.query
      (Tablename,where: '$coldate = ?  ',whereArgs: [Day],orderBy: '$coldate DESC' );
    return mapDAta.map((e) => Survey.fromMap(e)).toList();
  }

}