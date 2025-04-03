/*
*
*
* import 'package:flutter/material.dart';
import 'package:guestsurvey/Homepage.dart';
import 'package:guestsurvey/const.dart';
import 'package:guestsurvey/fin.dart';
import 'package:guestsurvey/getsrart.dart';
import 'package:guestsurvey/test2.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: test2(),
      bottomNavigationBar: Container(height: 80,
      padding: EdgeInsets.only(
        left: kDefaultPadding*2,
        right: kDefaultPadding*2,
        bottom: kDefaultPadding
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 38
                ,
            offset: Offset(0, -10),
            color: kPrimaryColor.withOpacity(0.38),
          ),


        ]


      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            nextScreenReplace(context, details());
            }, icon: Icon(Icons.favorite)),
          IconButton(onPressed: (){nextScreenReplace(context, Getstart());}, icon: Icon(Icons.favorite)),
          IconButton(onPressed: (){
            nextScreenReplace(context, HomePage());
          }, icon: Icon(Icons.favorite))
        ],
      ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor:kPrimaryColor ,
      elevation: 0,
      leading: IconButton(icon: Icon(Icons.cabin),onPressed: (){},),
    );
  }
}

* */