/*
*
*
import 'dart:async';

import 'package:flutter/material.dart';

import 'const.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController=PageController();
  int currentpage=0;
List<String> images=[
  'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg'
  ,'assets/OIP (4).jpeg',
  'assets/OIP (5).jpeg',
  'assets/OIP (6).jpeg'
];
  @override
  void initState() {
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.amber,

          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Stack(

                    children: [


                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)


                        ),
                        child: Icon(Icons.ac_unit_outlined),
                      )
                      , Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),


                        child: Icon(Icons.ac_unit_outlined,color: Colors.black,),
                      )
                    ],
                  )
                  , Stack(

                    children: [
                      PageView.builder(

    onPageChanged: (value) {
    setState(() {
    currentpage = value;
    });
    },
                        controller: _pageController,
                      itemCount: images.length,
                      itemBuilder: (context,index){
                        return Padding(padding: EdgeInsets.all(10),child: ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),)
                          ,child: Image.asset(images[index],fit: BoxFit.cover,

                        )
                          ,)
                          ,);
                      },
                      ),

                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                                (index) => buildDot(index: index),
                          ),
                        ),
                      ),

                    ],

                  )
                  ,


                ],
              ),





            ],
          ),
    ));
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width:  currentpage== index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentpage == index ? primaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}


* */