import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guestsurvey/Homepage.dart';
import 'package:guestsurvey/const.dart';
import 'package:guestsurvey/test.dart';

import 'gust.dart';

class Getstart extends StatefulWidget {
  const Getstart({super.key});

  @override
  State<Getstart> createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
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
    return Scaffold(

      body:InkWell(
        onLongPress: (){
          nextScreenReplace(context, HomePage());
        },



        onDoubleTap: (){
          nextScreenReplace(context, HomePage());
        },
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
                return Image.asset(images[index],fit: BoxFit.fill,

                );
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
