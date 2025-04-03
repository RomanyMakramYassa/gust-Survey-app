import 'dart:io';
import 'package:flutter/material.dart';

import 'package:excel/excel.dart' ;

import 'package:guestsurvey/const.dart';
import 'package:guestsurvey/sests.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import 'gust.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExportScreen extends StatefulWidget {
  @override
  _ExportScreenState createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  GlobalKey<FormState>?_key;
  @override
  void initState() {
    GUST.gust.init();
    // TODO: implement initState
    super.initState();
  }
  TextEditingController _dateController = TextEditingController();
  String? filePath; // لتخزين مسار الملف بعد التصدير

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy/MM/dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Excel sheet"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
            validator:  (value) =>
                value!.isEmpty ? 'This field is required' : null,
                onTap: (){_selectDate(context);},
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "choose day",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context), // فتح الـ DatePicker
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/20),
              Container(
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.black,


                  borderRadius: BorderRadius.circular(20),




                ),

                child: TextButton(

                  onPressed: () async {
                    if (_dateController.text.isNotEmpty) {
                      String selectedDay = _dateController.text;
                      String? path = await exportToExcel(selectedDay);
                      setState(() {
                        filePath = path;
                      });
                    }
                    /* if( _key!.currentState!.validate()
                    ){
                      String selectedDay = _dateController.text;
                      String? path = await exportToExcel(selectedDay);
                      setState(() {
                        filePath = path;
                      });
                    }
                    * */

                  },
                  child: Text(" Excel ",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),

              // عرض رابط الملف بعد التصدير
              if (filePath != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("📂 file saved :", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                    SelectableText(filePath!, style: TextStyle(color: Colors.blue)),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
  Future<String?> exportToExcel(String selectedDay) async {
    GUST.gust.init();
    //return GUST.gust.queryrate();

    List<Survey> customers = await GUST.gust.getexcel(selectedDay);


    if (customers.isEmpty) {
      print('⚠️no gusts available');
      return null;
    }

    var excel = Excel.createExcel();
    var sheet = excel[excel.getDefaultSheet()!];

    // إضافة عناوين الأعمدة
    sheet.appendRow([TextCellValue('Name'),
      TextCellValue('WhatsApp number'),
      TextCellValue('Email Address'),
      TextCellValue('Room number'),
      TextCellValue('Rate'),
      TextCellValue('comment'),
      TextCellValue('Did we meet your expectations'),
      TextCellValue('comment'),
      TextCellValue('would you stay with us again'),
      TextCellValue('comment'),
      TextCellValue('Date'),
    ]);


    // إضافة البيانات إلى Excel
    for (int i=0;i<customers.length;i++) {
      sheet.appendRow([
        TextCellValue(customers[i].Name!),
        TextCellValue( customers[i].Phone!),
        TextCellValue( customers[i].Email!),

        TextCellValue(     customers[i].Room!),
        TextCellValue( customers[i].rate!.toString()),
        TextCellValue(    customers[i].CommentR!),
        TextCellValue(    customers[i].meet!.toString()),
        TextCellValue(   customers[i].Commentm!),
        TextCellValue(   customers[i].stay!),
        TextCellValue(     customers[i].Comments!),
        TextCellValue(     customers[i].date.toString()),

      ]);
    }

    // تحديد مسار التخزين
    Directory? directory = await getExternalStorageDirectory();
    String folderPath = '${directory!.path}/GustSurveyData';
    Directory(folderPath).createSync(recursive: true);
    String Savedata=selectedDay.replaceAll('/', '-');
    String filePath = '$folderPath/GustSurveyData_$Savedata.xlsx';
    File file = File(filePath);
    await file.writeAsBytes(excel.encode()!);
//file.writeAsBytes(excel.encode()!);
    print('✅file saved :   $filePath');

    // فتح الملف تلقائيًا

    if (await file.exists()) {
      print('📂 the sheet opening...');
      await OpenFile.open(filePath);
    } else {
      print('⚠️ the file doesnot exist!');
    }

    return filePath;
  }
}


