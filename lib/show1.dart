import 'package:flutter/material.dart';

import 'package:guestsurvey/gust.dart';
import 'package:guestsurvey/sests.dart';
import 'package:guestsurvey/survey.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'const.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    GUST.gust.init();

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    TextEditingController _editTXTController =
    TextEditingController(text: theMESSAGE);
    return Scaffold(
      appBar: AppBar(title: Text('Most rated'),
      centerTitle: true,),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [

              const SizedBox(
                height: 5,
              ),
             FutureBuilder(future: viewsurveyrate(), builder: (context,AsyncSnapshot<List<Survey>>snapshot)
             {
               if(snapshot.hasData){
                 List<Survey> servey=snapshot.data!;
                 return  ListView.builder(

                     physics: const NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemCount: servey.length,
                     itemBuilder: (context, index) => ListTile(
                       leading: Text('${servey[index].rate!}'),
                       title: Text('${servey[index].Name!}'),
                       subtitle:  Text('${servey[index].date!}'),
                       trailing: SizedBox(
                         width: MediaQuery.of(context).size.width*0.4,
                         child: Row(children: [
                           IconButton(
                               onPressed: () {
                                 showDialog(

                                   context: context,
                                   builder: (BuildContext context) {
                                     return AlertDialog(

                                       title: Text('are you need to delete this survey'
                                         ,style: TextStyle(color: Colors.black),),

                                       actions: <Widget>[
                                         TextButton(
                                           onPressed: () => Navigator.pop(context),
                                           child: Text('Cancel'),
                                         ),
                                         TextButton(
                                           onPressed: () {
                                             setState(() {
                                               DeleteSurvey(servey[index].id!);

                                             });


                                             Navigator.pop(context);
                                           },
                                           child: Text('yes'),
                                         ),
                                       ],
                                     );
                                   },
                                 );

                               }, icon: const Icon(Icons.delete)),
                           IconButton(
                               onPressed: () {
                                 shoeeditdilog(servey[index]);

                               }, icon: const Icon(Icons.edit)),
                           IconButton(

                               onPressed: () {
                                 showDialog(

                                   context: context,
                                   builder: (BuildContext context) {
                                     return AlertDialog(
                                       backgroundColor: Colors.black,
                                       title: Text('${_editTXTController.value.text!}',),
                                       content: SingleChildScrollView(
                                         child: TextFormField(
                                           minLines: 3,
                                           maxLines: null,
                                           decoration: InputDecoration(



                                                border: OutlineInputBorder(

                                               borderRadius: BorderRadius.circular(10),
                                               borderSide: BorderSide(color: Colors.white),

                                             ),
                                             enabledBorder: OutlineInputBorder(


                                               borderRadius: BorderRadius.circular(10),
                                               borderSide: BorderSide(color: Colors.white),


                                             ),

                                           ),
                                           keyboardType: TextInputType.multiline,
                                           controller: _editTXTController,
                                           validator: (value) =>
                                           value!.isEmpty ? 'This field is required' : null,
                                         ),
                                       ),

                                       actions: <Widget>[
                                         TextButton(
                                           onPressed: () {
                                             setState(() {
                                               _editTXTController.value.text!=theMESSAGE;
                                             });

                                             Navigator.pop(context);

                                           },
                                           child: Text('Cancel'),
                                         ),
                                         TextButton(
                                           onPressed: () {
                                             setState(() {

                                               _sendEmail(servey[index].Email!,_editTXTController.value.text!,servey[index].Name!);

                                               _editTXTController.value.text!=theMESSAGE;
                                             });


                                             Navigator.pop(context);
                                           },
                                           child: Text('yes'),
                                         ),
                                       ],
                                     );
                                   },
                                 );


                               }, icon: const Icon(Icons.send)),
                         ]),
                       ),
                     ));
               }
               else if(snapshot.hasError){
                 return Text(snapshot.error.toString());
               }
               else{
                 return CircularProgressIndicator();
               }
             })
            ]),
          )),
    );
  }
  Future<void> _sendEmail(String email,String TXT,String MR) async {
    final String username = 'call Eng Romany'; //romany.makram.yassa@gmail.com // الإيميل المرسل منه
    final String password = 'call Eng Romany';//sykh atuc efgj ubwc  // استخدم "App Password" من إعدادات Gmail

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Romany')
      ..recipients.add(email)  // البريد المدخل
      ..subject = '[Action Required] Mandatory multi-factor authentication for Google Cloud console, gcloud CLI, and Firebase console access'
      ..text = 'Dear Mr/Mrs: ${MR}\n ${TXT}';

    try {
      final sendReport = await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email sent successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sending failed call Eng Romany Makram \n$e')));
    }
  }
  Future<List<Survey>> viewsurveyrate(){
    GUST.gust.init();
    return GUST.gust.queryrate();
  }
  DeleteSurvey(int ID){
    return GUST.gust.Delete(ID).then((value) {
      if(value>0){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:Text('your survey Deleted')
        ,
        )
        );

        setState(() {

        });
      }
    });

  }
  void updatesUrvey( Survey ser){
    GUST.gust.updateSurvey(ser).then((value) {
      if(value>0){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('your survey updated') ));

        setState(() {

        });
      }

    });
  }
  void shoeeditdilog(Survey note) {
    TextEditingController _editController =
    TextEditingController(text: note.Name);
    TextEditingController _editeamilController =
    TextEditingController(text: note.Email);

    TextEditingController _editPhoneController =
    TextEditingController(text: note.Phone);
    TextEditingController _editroomController =
    TextEditingController(text: note.Room);
    TextEditingController _editc1Controller =
    TextEditingController(text: note.CommentR);
    TextEditingController _editc3Controller =
    TextEditingController(text: note.Comments);
    TextEditingController _editc2Controller =
    TextEditingController(text: note.Commentm);
    GlobalKey<FormState> _editKey = GlobalKey();
    String stayus=note.stay!;
    int res1=note.rate!;
    int res2=note.meet!;
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context,setStateDialog){
            return   AlertDialog(
              backgroundColor: Colors.black,
              title: Text('Update Survey'),
              content: SingleChildScrollView(

                child: Container(
                  padding: EdgeInsets.all(8),

                  child: Wrap(

                      children: [
                        Form(
                            key: _editKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editController,
                                  validator: (value) =>
                                  value!.isEmpty ? 'This field is required' : null,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editeamilController,
                                  validator: (value) =>
                                  value!.isEmpty ? 'This field is required' : null,
                                ),


                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _editPhoneController,
                                  validator: (value) =>
                                  value!.isEmpty ? 'This field is required' : null,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editroomController,
                                  validator: (value) =>
                                  value!.isEmpty ? 'This field is required' : null,
                                ),
                                SingleChildScrollView(

                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(10, (index) {
                                        int rating = index + 1;
                                        return Row(
                                          children: [
                                            Radio<int>(


                                              activeColor: Colors.white,
                                              value: rating,
                                              groupValue: res1,
                                              onChanged: (int? value) {
                                                setStateDialog(() {
                                                  res1 = value!;

                                                  note.rate=res1;
                                                });
                                              },
                                            ),
                                            Text("$rating",
                                              style: TextStyle(fontWeight: FontWeight.bold
                                                  ,fontSize: 16,color: Colors.white
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editc1Controller,

                                ),
                                SingleChildScrollView(

                                  scrollDirection: Axis.horizontal,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(10, (index) {
                                        int rating = index + 1;
                                        return Row(
                                          children: [
                                            Radio<int>(
                                              activeColor: Colors.white,
                                              value: rating,
                                              groupValue: res2,
                                              onChanged: (int? value) {
                                                setStateDialog(() {
                                                  res2 = value!;
                                                  note.meet=res2;
                                                });
                                              },
                                            ),
                                            Text("$rating",
                                              style: TextStyle(fontWeight: FontWeight.bold
                                                  ,fontSize: 16,color: Colors.white
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editc2Controller,

                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Would you stay with us again?',style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,color: Colors.white
                                    ),),



                                    RadioListTile(


                                        activeColor: Colors.white,

                                        title: const Text('YES',style: TextStyle(fontWeight: FontWeight.bold
                                            ,fontSize: 16,color: Colors.white
                                        ),
                                        ),
                                        value: 'YES',
                                        groupValue: stayus,
                                        onChanged: (value) {
                                          setStateDialog(() {
                                            stayus = value!;
                                            note.stay=stayus;
                                          });
                                        }),
                                    RadioListTile(
                                        activeColor: Colors.white,
                                        title: const Text('NO',style: TextStyle(fontWeight: FontWeight.bold
                                            ,fontSize: 16,color: Colors.white
                                        ),),
                                        value: 'NO',
                                        groupValue: stayus,
                                        onChanged: (value) {
                                          setStateDialog(() {
                                            stayus = value!;
                                            note.stay=stayus;
                                          });
                                        }),


                                    const SizedBox(height: 10),
                                  ],

                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: _editc3Controller,

                                ),
                              ],
                            )
                        ),
                      ]),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {
                      if (_editKey.currentState!.validate()) {
                        note.Name = _editController.value.text;
                        note.Email=_editeamilController.value.text;

                        note.Phone=_editPhoneController.value.text;
                        note.Room=_editroomController.value.text;

                        note.rate=res1;
                        note.meet=res2;
                        note.stay=stayus;

                        note.CommentR=_editc1Controller.value.text;
                        note.Commentm=_editc2Controller.value.text;
                        note.Comments=_editc3Controller.value.text;


                        updatesUrvey(note);


                      }
                      Navigator.pop(context);

                    },
                    child: Text('Update'))
              ],
            );
          });
        }
    );
  }
  Future<List<Survey>>view(){
   return GUST.gust.query();
  }


}
