import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guestsurvey/gust.dart';
import 'package:guestsurvey/show1.dart';
import 'package:guestsurvey/showall.dart';
import 'package:guestsurvey/survey.dart';

import 'const.dart';
import 'excel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController=PageController();
  int currentpage=0;
  List<String> images=[
    'assets/ph1.jpg'
    ,'assets/ph2.jpg',
    'assets/ph3.jpg',
    'assets/ph4.jpg',
    'assets/ph5.jpg'
    ,'assets/ph6.jpg',
    'assets/ph7.jpg',
    'assets/ph8.jpg',
    'assets/ph9.jpg'
    ,'assets/ph10.jpg',
    'assets/ph11.jpg',
    'assets/ph12.jpg',
    'assets/ph13.jpg'
    ,'assets/ph4.jpg'
  ];
  void initState() {
    GUST.gust.init();
    // TODO: implement initState
    super.initState();
    Timer.periodic( const Duration(seconds:5),
            (Timer timer){
          if(currentpage<images.length-1){
            currentpage++;
          }else
          {
            currentpage=0;
          }
          _pageController.animateToPage(currentpage, duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        }
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: kDefaultPadding*3),
                child: SizedBox(
                  height: size.height*0.8,
                  child: Row(
                    children: [
                      Expanded(
                          child:Padding(
                            padding: const EdgeInsets.symmetric( vertical: 0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      }, icon:Icon(Icons.arrow_back_ios) ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.000000002,),
                                InkWell(
                                  onTap: (){
                                    nextScreenReplace(context, ExportScreen());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
                                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                                    height: size.height*0.105,width: size.width*0.1815
                                    ,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(6),


                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 15)
                                            ,blurRadius: 22,
                                            color:Colors.white.withOpacity(0.22),

                                          ),
                                          BoxShadow(
                                            offset: Offset(-15, -15)
                                            ,blurRadius: 22,
                                            color: Colors.white,

                                          )
                                        ]
                                    ),
                                    child: Icon(Icons.import_export_sharp,color: Colors.white,),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    nextScreenReplace(context, MyHomePage1());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
                                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
                                    height: size.height*0.105,width: size.width*0.1815
                                    ,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(6),


                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 15)
                                            ,blurRadius: 22,
                                            color:Colors.white.withOpacity(0.22),

                                          ),
                                          BoxShadow(
                                            offset: Offset(-15, -15)
                                            ,blurRadius: 22,
                                            color: Colors.white,

                                          )
                                        ]
                                    ),
                                    child: Icon(Icons.leaderboard_sharp,color: Colors.white,),
                                  ),
                                ),

                                InkWell(
                                  onTap: (){
                                    nextScreenReplace(context, MyHomePage()
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
                                    padding: EdgeInsets.all(kDefaultPadding/2),
                                    height: size.height*0.105,width: size.width*0.1815
                                    ,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(6),


                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 15)
                                            ,blurRadius: 22,
                                            color: Colors.white.withOpacity(0.22),

                                          ),
                                          BoxShadow(
                                            offset: Offset(-15, -15)
                                            ,blurRadius: 22,
                                            color: Colors.white,

                                          )
                                        ]
                                    ),
                                    child: Icon(Icons.star_outline_sharp,color: Colors.white,),
                                  ),
                                )


                              ],
                            ),
                          )

                      ),
                      Container(
                        height: size.height*0.8,
                        width: size.width*0.75,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft:Radius.circular(60),
                                bottomLeft: Radius.circular(60)),
                            boxShadow: [
                              BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.29)
                                  ,offset: Offset(0, 10)
                                  ,blurRadius: 50
                              )
                            ],

                        //    image: DecorationImage(image:
                          //  AssetImage('assets/OIP (4).jpeg'

                            //),fit: BoxFit.cover,
                                //alignment: Alignment.centerLeft
                         //   )

                        ),
                        child: Stack(


                          children: [
                            PageView.builder(
                              scrollBehavior: ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.glow),

                              onPageChanged: (value) {
                                setState(() {
                                  currentpage = value;
                                });
                              },
                              controller: _pageController,
                              itemCount: images.length,
                              itemBuilder: (context,index){
                                return ClipRRect(
                                  borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),

                                  )
                                  ,child: Image.asset(images[index],fit: BoxFit.fill,

                                )
                                  ,);
                              },
                            ),

                            Positioned(

bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    images.length,
                                        (index) => buildDot(index: index),
                                  ),
                                ),
                              ),
                            ),

                          ],

                        ),

                      )
                    ],
                  ),
                ),
              ),

              Container(

                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20)
                    ,border: Border.all(width: 3,color: Colors.black, ),


                ),
                child: TextButton(onPressed: (){
                  nextScreenReplace(context, survey()
                  );

                }, child: Text('Add New Survey',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)
                  ,
                ),
              ),

              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width:  currentpage== index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentpage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
