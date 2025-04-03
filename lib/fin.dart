/**
 *
 * import 'package:flutter/material.dart';
    import 'package:guestsurvey/const.dart';

    class details extends StatelessWidget {
    const details({super.key});

    @override
    Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
    body: SingleChildScrollView(
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
    padding: const EdgeInsets.symmetric( vertical: kDefaultPadding*3),
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
    Spacer(),
    Container(
    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
    padding: EdgeInsets.all(kDefaultPadding/2),
    height: 60,width: 60
    ,
    decoration: BoxDecoration(
    color: kBackgroundColor,
    borderRadius: BorderRadius.circular(6),


    boxShadow: [
    BoxShadow(
    offset: Offset(0, 15)
    ,blurRadius: 22,
    color: kPrimaryColor.withOpacity(0.22),

    ),
    BoxShadow(
    offset: Offset(-15, -15)
    ,blurRadius: 22,
    color: Colors.white,

    )
    ]
    ),
    child: Icon(Icons.sunny),
    ),
    Container(
    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
    padding: EdgeInsets.all(kDefaultPadding/2),
    height: 60,width: 60
    ,
    decoration: BoxDecoration(
    color: kBackgroundColor,
    borderRadius: BorderRadius.circular(6),


    boxShadow: [
    BoxShadow(
    offset: Offset(0, 15)
    ,blurRadius: 22,
    color: kPrimaryColor.withOpacity(0.22),

    ),
    BoxShadow(
    offset: Offset(-15, -15)
    ,blurRadius: 22,
    color: Colors.white,

    )
    ]
    ),
    child: Icon(Icons.sunny),
    ),
    Container(
    margin: EdgeInsets.symmetric(vertical:size.height*0.03 ),
    padding: EdgeInsets.all(kDefaultPadding/2),
    height: 60,width: 60
    ,
    decoration: BoxDecoration(
    color: kBackgroundColor,
    borderRadius: BorderRadius.circular(6),


    boxShadow: [
    BoxShadow(
    offset: Offset(0, 15)
    ,blurRadius: 22,
    color: kPrimaryColor.withOpacity(0.22),

    ),
    BoxShadow(
    offset: Offset(-15, -15)
    ,blurRadius: 22,
    color: Colors.white,

    )
    ]
    ),
    child: Icon(Icons.sunny),
    )


    ],
    ),
    )

    ),
    Container(
    height: size.height*0.8,
    width: size.width*0.75,

    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft:Radius.circular(60),
    bottomLeft: Radius.circular(60)),
    boxShadow: [
    BoxShadow(
    color: kPrimaryColor.withOpacity(0.29)
    ,offset: Offset(0, 10)
    ,blurRadius: 50
    )
    ],

    image: DecorationImage(image:
    AssetImage('assets/OIP (4).jpeg'

    ),fit: BoxFit.cover,
    alignment: Alignment.centerLeft
    )

    ),

    )
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
    child: Row(
    children: [
    RichText(text: TextSpan(
    children: [
    TextSpan(
    text: 'Romany\n',
    style: Theme.of(context).textTheme.headline4?.copyWith(color:kTextColor,fontWeight: FontWeight.bold )
    ),
    TextSpan(text: "egypt",style: TextStyle(
    color: kPrimaryColor,fontSize: 20,fontWeight: FontWeight.w300
    ))
    ]
    )

    ),
    Spacer(),
    Text( '\$5655',style:
    Theme.of(context).textTheme.headline5?.copyWith(color:kPrimaryColor )
    )
    ],
    ),
    )
    ],
    ),
    ),
    );
    }
    }

 */