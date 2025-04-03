/*


import 'package:flutter/material.dart';
import 'package:guestsurvey/const.dart';

class test2 extends StatelessWidget {
  const test2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          headerW(size: size)

          ,titlemorebtn(title:'recomnded',press: (){},),
          SingleChildScrollView(scrollDirection: Axis.horizontal
            ,child: Row(
              children: [
                plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),

                plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
              ],
            )
          )
          ,titlemorebtn(title:'featured',press: (){},),
          SingleChildScrollView(scrollDirection: Axis.horizontal
              ,child: Row(
                children: [
                  plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),

                  plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                  plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                  plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                  plantcard(image: 'assets/Golden-Tulip-Plaza-Hotel-Cairo.jpg',tittle: 'romany',press: (){},price: 50, country: 'egypt',),
                ],
              )
          )
          ,

        ],
      ),
    );

  }
}

class plantcard extends StatelessWidget {
  const plantcard({
    super.key, required this.image, required this.country, required this.tittle, required this.press, required this.price,

  });
final String image,country,tittle;
final Function press;
final int price;


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width *0.4,
      margin: EdgeInsets.only(
        top: kDefaultPadding/2,
        bottom: kDefaultPadding*2.5,
        left: kDefaultPadding

      ),
      child: Column(
        children: [
          Image.asset(image),
          InkWell(
            onTap: (){press;},
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding/2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10)
                      ,blurRadius: 50
,color: kPrimaryColor.withOpacity(0.2)
                  )
                ]
              ),
              child: Row(
                children: [
RichText(text: TextSpan(
  children: [
    TextSpan(text: '${tittle}\n'.toUpperCase(),style:Theme.of(context).textTheme.button ),
    TextSpan(text: country.toUpperCase(),style:TextStyle(color: kPrimaryColor.withOpacity(0.5))
    ),

  ]
)),
    const Spacer(),
    Text('\$${price}',style:Theme.of(context).textTheme.button?.copyWith(color: kPrimaryColor))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class titlemorebtn extends StatelessWidget {
  const titlemorebtn({
    super.key, required this.title, required this.press,
  });
  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          titlerecomnded(text: title,),
          const Spacer(),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
            ,color: kPrimaryColor
            ),
            child: TextButton(onPressed: (){press;}, child: Text('More',style: TextStyle(color: Colors.white),)
            ,
            ),
          ),

        ],
      ),
    );
  }
}

class titlerecomnded extends StatelessWidget {
  const titlerecomnded({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(height: 24
      ,child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding/4),
            child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          )
          ,
          Container(height: 7,color: kPrimaryColor.withOpacity(0.2)
            ,margin: const EdgeInsets.only(right: kDefaultPadding/4),
            )

        ],
      ),);
  }
}

class headerW extends StatelessWidget {
  const headerW({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding*2.5),
      height: size.height*0.2,
      child: Stack(
        children: [

         Container(
           padding: EdgeInsets.only(
             left: kDefaultPadding,
             right: kDefaultPadding,
             bottom: 36+kDefaultPadding
           ),
           height:size.height*0.2-27,
           decoration: BoxDecoration(
             color: kPrimaryColor,
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),
             bottomRight: Radius.circular(35) ),

           ),
           child: Row(
             children: [
               Text('data',style: Theme.of(context).textTheme.headline5?.copyWith(
                   color: Colors.white,fontWeight: FontWeight.bold
               )
                 ,)
               ,Spacer(),
               Icon(Icons.abc),
             ],
           ),
         ) ,
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),

            height: 54
            ,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              offset: Offset(0, 10)
                  ,blurRadius: 50,
              color: kPrimaryColor.withOpacity(0.23)
            ),],
            color: Colors.white,

          ),
                child: TextField(
                  onChanged: (value){

                  },

                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: kPrimaryColor.withOpacity(0.5)
                    ,

                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(Icons.search_off)
                      ,

                  ),
                ),
          ))
        ],
      ),
    );
  }
}

*****/