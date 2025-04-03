import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void nextScreenReplace(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
const Color primaryColor = Color(-158912);
const kAnimationDuration = Duration(milliseconds: 200);
const kPrimaryColor = Colors.black;
 //const kTextColor = Color (0xFF3C4046);
//const kBackgroundColor = Color (0xFFF9F8FD);
 const double kDefaultPadding = 20.0;
 const DBname='Survey.db';
 const Tablename='survey';
String theMESSAGE='romany bymsy 3lekm';
 const dbversion=1;
 const colid='gustID';
const colname='gustName';
const colemail='gustEmail';
const coladdress='gustAddress';
const colphone='gustPhone';
const colroomnumber='gustRoom';
const colrate='gustRate';
const colmeet='gustmeet';
const colstay='guststay';
const colcommentR='gustcommentR';
const colcommentm='gustcommentM';
const colcomments='gustcommentS';
const coldate='gustdate';
class DATETIME{
 static String currentdate(){
  var dateTime=DateTime.now();
  return '${DateFormat('yyyy/MM/dd').format(dateTime)}';
 }
 }
Color nbasic=Colors.blue.shade900;
Color basic=Colors.white;


