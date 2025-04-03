import 'package:guestsurvey/gust.dart';

import 'const.dart';

class Survey{
  String? Name;
  String? Email;

  String? Phone;
  String? Room;
  String? Commentm;
  String? CommentR;
  String? Comments;
  String? date;

  int? id;
  int? rate;
  int? meet;
  String? stay;
  Survey({required this.Name,this.date,required this.Email,this.Commentm,
    this.CommentR,this.Comments,this.id,this.meet,this.Phone,this.rate,this.Room,this.stay});

  Map<String,dynamic> toMap(){     return {  colid:id,
   colname:Name,
  colemail:Email,

  colphone:Phone,
  colroomnumber:Room,
  colrate:rate, colmeet:meet,
  colstay:stay
  ,colcommentR:CommentR,
  colcommentm:Commentm,
  colcomments:Comments,
  coldate:date
};

}

  Survey.fromMap(Map<String,dynamic>map)
   {
    Name=map[colname];
    Email=map[colemail];

    Phone=map[colphone];
    Room=map[colroomnumber];
    id=map[colid];
    rate=map[colrate];
    meet=map[colmeet];
    stay=map[colstay];
    CommentR=map[colcommentR];
    Comments=map[colcomments];
    Commentm=map[colcommentm];
    date=map[coldate];

}
}