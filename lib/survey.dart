import 'package:flutter/material.dart';
import 'package:guestsurvey/gust.dart';
import 'package:guestsurvey/sests.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:url_launcher/url_launcher.dart';

import 'const.dart';

class survey extends StatefulWidget {
  const survey({super.key});

  @override
  State<survey> createState() => _surveyState();
}

class _surveyState extends State<survey> {
  @override

  String _selected = ' ';

  int? _result=0;
  int? _result2=0;
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController RoomController = TextEditingController();
  TextEditingController CommentController = TextEditingController();
  TextEditingController Comment1Controller = TextEditingController();
  TextEditingController Comment2Controller = TextEditingController();

  GlobalKey<FormState>?_key;
  Color nbasic=Colors.blue.shade900;
  Color basic=Colors.white;

  Future<void> _sendEmai2l(String email) async {
  //  final String email = _emailController.text;
    final String subject = Uri.encodeComponent("تحية");
    final String body = Uri.encodeComponent("ازيك؟");

    final Uri emailUri = Uri(
      scheme: 'Romany',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("لا يمكن فتح تطبيق البريد")),
      );
    }
  }
  Future<void> _sendEmail(String email) async {
    final String username = 'romany.makram.yassa@gmail.com';  // الإيميل المرسل منه
    final String password = 'sykh atuc efgj ubwc';  // استخدم "App Password" من إعدادات Gmail

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Romany')
      ..recipients.add(email)  // البريد المدخل
      ..subject = '[Action Required] Mandatory multi-factor authentication for Google Cloud console, gcloud CLI, and Firebase console access'
      ..text = '[Action Required] Mandatory multi-factor authentication for Google Cloud console, gcloud CLI, and Firebase console access؟';

    try {
      final sendReport = await send(message, smtpServer);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم إرسال الإيميل بنجاح')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('فشل الإرسال: $e')));
    }
  }

  void initState() {
    // TODO: implement initState
    _key=GlobalKey();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
        backgroundColor: basic,
      appBar: AppBar(
        centerTitle: true,
        leading:  IconButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            onPressed: (){
              Navigator.pop(context);
            }, icon:Icon(Icons.arrow_back_ios) ),

        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
        children: [
        TextSpan(text: 'Steigenberger\n'.toUpperCase(),style:Theme.of(context).
        textTheme.headline4?.copyWith
          (color: Colors.black,fontSize: 30,), ),
    TextSpan(text: 'Aqua Magic'.toUpperCase(),style:TextStyle(color: Colors.grey,fontSize: 18)
    ),

    ]
    ),
      ),

        backgroundColor: basic,
    ),
body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Form(
      key: _key ,

      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),

            child: Column(
              children: [

                Text(

                  'Thank you For Staying at Steigenberger Aqua Magic.'

                    ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
                  ,color: nbasic,),
                  textAlign: TextAlign.justify,
                ),
                Text(


                      'Your Wellbeing is very important for us and your satisfaction is our main priority.'
                      ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                  color: nbasic,),
                  textAlign: TextAlign.justify,
                ),
                Text(

                   'We strive to provide you with the best quality of service and to accommodate to all your needs. In order to continuously improve our service to you, we appreciate your assistant in sharing your experience and thoughts with us.'
                  ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold
                  ,color: nbasic),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(' Name:',style: TextStyle(fontSize: 13,color:
            nbasic),

            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildTextField('Name', Icons.person_2_outlined,NameController),
          ),
          SizedBox(height: 5,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text('Email:',style: TextStyle(fontSize: 13,color: nbasic),

            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildTextField('Email', Icons.email_outlined,EmailController),
          ),





          SizedBox(height: 5,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text('WhatsApp Number:',style: TextStyle(fontSize: 13,color:
            nbasic),

            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildTextFieldnumber('WhatsAppNumber', Icons.phone,PhoneController),
          )
          ,        SizedBox(height: 5,),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text(' Room Number:',style: TextStyle(fontSize: 13,color:
            nbasic),

            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildTextField('Room Number', Icons.roofing,RoomController),
          )
          ,        SizedBox(height: 5,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('How would you rate your overall experience?',style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),),

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
                            activeColor: nbasic,
                            value: rating,
                            groupValue: _result,
                            onChanged: (int? value) {
                              setState(() {
                                _result = value!;
                              });
                            },
                          ),
                          Text("$rating",
                            style: TextStyle(fontWeight: FontWeight.bold
                                ,fontSize: 16
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Text('Comment...:',style: TextStyle(fontSize: 13,color: nbasic),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: buildTextFieldcoment('Comment ....', null,CommentController),
              ),


            ],
          ),

SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Did we meet your expectations?',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
              ),),
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
                            activeColor: nbasic,
                            value: rating,
                            groupValue: _result2,
                            onChanged: (int? value) {
                              setState(() {
                                _result2 = value!;
                              });
                            },
                          ),
                          Text("$rating",
                            style: TextStyle(fontWeight: FontWeight.bold
                                ,fontSize: 16
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Text('Comment...:',style: TextStyle(fontSize: 13,),

                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: buildTextFieldcoment('Comment ....', null,Comment1Controller),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Would you stay with us again?',style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold
              ),),



              RadioListTile(


                  activeColor: nbasic,

                  title:  Text('YES',style: TextStyle(fontWeight: FontWeight.bold
                      ,fontSize: 16,color: nbasic
                  ),
                  ),
                  value: 'YES',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.white,
                  title:  Text('NO',style: TextStyle(fontWeight: FontWeight.bold
                      ,fontSize: 16,color: nbasic
                  ),),
                  value: 'NO',
                  groupValue: _selected,
                  onChanged: (value) {
                    setState(() {
                      _selected = value!;
                    });
                  }),


              const SizedBox(height: 5),
            ],
          ),

//coomment
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.topLeft,
            child: Text('Comment...:',style: TextStyle(fontSize: 13,color: Colors.white),

            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: buildTextFieldcoment('Comment ....', null,Comment2Controller),
          ),
          Container(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20)
              ,border: Border.all(width: 3,color: nbasic ),


            ),
            child: TextButton(onPressed: (){
              if(_key!.currentState!.validate()){
                Survey survey= Survey(Name: NameController.value.text, Email: EmailController.value.text
                    , date:
                    DATETIME.currentdate(),CommentR: CommentController.value.text,
                    Commentm: Comment1Controller.value.text,Comments:Comment2Controller.value.text,
                    meet: _result2,Room: RoomController.value.text,
                    Phone: PhoneController.value.text,rate: _result,stay: _selected,

                );
                SaveSURVEY(survey);
              //  _sendEmail(EmailController.text);
                PhoneController.text='';
                RoomController.text='';
                NameController.text='';
                EmailController.text='';
                Comment2Controller.text='';
                Comment1Controller.text='';
                CommentController.text='';
                AddressController.text='';
                _result=0;
                _result2=0;
                _selected='';

                Navigator.pop(context);
                //email





              }


            }, child: Text('Submit',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 35,color: Colors.blue.shade900),)
              ,
            ),
          ),
          SizedBox(height: 10,),










        ],
      ),
    ),
  ),
),
    );
  }

  Widget buildTextField(String hintText, IconData? icon,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator:  (value) =>
        value!.isEmpty ? 'This field is required' : null,

        controller: controller,



        decoration: InputDecoration(

          hintText: hintText,

          prefixIcon: icon != null ? Icon(icon, color: nbasic) : null,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: nbasic),

          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: nbasic),


          ),
                 ),
      ),
    );
  }

  Widget buildTextFieldnumber(String hintText, IconData? icon
      ,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
         validator: (value) =>
        value!.isEmpty ? 'This field is required' : null,

        controller: controller,
        keyboardType: TextInputType.phone,


        decoration: InputDecoration(



          hintText: hintText,

          prefixIcon: icon != null ? Icon(icon, color:nbasic) : null,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: nbasic),

          ),
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:nbasic),


          ),
        ),
      ),
    );
  }

  Widget buildTextFieldcoment(String hintText, IconData?
  icon,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(

        controller: controller,


        decoration: InputDecoration(

          hintText: hintText,

          prefixIcon: icon != null ? Icon(icon, color: nbasic) : null,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: nbasic),

          ),
          enabledBorder: OutlineInputBorder(


            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: nbasic),


          ),

        ),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        minLines: 3,
      ),
    );
  }

  void SaveSURVEY(Survey survey) {
    GUST.gust.insert(survey).then((value) {
      if(value>0){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('your survey submitted') ));

   setState(() {

   });
      }
    });

  }
  Future<List<Survey>> viewsurveyrate(){
    return GUST.gust.queryrate();
  }
  Future<List<Survey>> viewsurveyall(){
    return GUST.gust.query();
  }
  DeleteSurvey(int ID){
    return GUST.gust.Delete(ID).then((value) {
      if(value>0){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('your survey Deleted') ));

        setState(() {

        });
      }
    });

  }


}
