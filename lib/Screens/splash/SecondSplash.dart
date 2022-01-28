import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({Key? key}) : super(key: key);

  @override
  _SecondSplashState createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {

  var FruitList = [
    'We are providing the best Burger in our\nTown the Bun and Salad choice\nmakes it different from other \nresteurents.',
    'We are providing the best nuggets in our\nTown the chicken and oil choice\nmakes it different from other \nresteurents.',
    'We are providing the best pizza in our\nTown the jalapinnos and cheese choice\nmakes it different from other \nresteurents.',
    'We are providing the best Fries in our\nTown the oil and Potatoes choice\nmakes it different from other \nresteurents.',
    'We are providing the best Drinks in our\nTown the cost and taste choice\nmakes it different from other \nresteurents.',
  ];

  @override
  int activeindex = 0;
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;

    return Scaffold(

      body: SingleChildScrollView(

        child: Stack(
         children: <Widget>[
           Container(
             color: Colors.black,
             width: MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height,

           ),
           Column(
            children: [
              SizedBox(
                height: height/5,
              ),

               Container(
                   width: MediaQuery.of(context).size.width,
                   // height:MediaQuery.of(context).size.height/2,

                   alignment: Alignment.center,
          child: CarouselSlider(

            options: CarouselOptions(
              height:  500,
              reverse: true,

              viewportFraction: 1,
              onPageChanged: (index , reason)  =>
                  setState(() => activeindex = index),
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),

            ),


            items: ['assets/burg.png','assets/nuggets.png','assets/pizza.png','assets/fries.png','assets/coke.png'].map((i) {

              return Builder(

                  builder : (BuildContext context) {
                    itemCount: FruitList.length;
                    return Container(
                      width: MediaQuery.of(context).size.width,

                      margin : EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          // Image.asset(i),
                          Container(
                            child: Image.asset(i,
                            width: 250,
                            height: 250,

                            ),
                          ),


                          SizedBox( height:  10,),
                          if (i == 'assets/burg.png')
                        Text(
                          '${FruitList[0]}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                              fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      if (i == 'assets/nuggets.png')
                                Text(
                                  '${FruitList[1]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              if (i == 'assets/pizza.png')
                                Text(
                                  '${FruitList[2]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 19,

                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              if (i == 'assets/fries.png')
                                Text(
                                  '${FruitList[3]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              if (i == 'assets/coke.png')
                                Text(
                                  '${FruitList[4]}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                            ],



                      ),


                    );
                  }
              );
            }).toList(),
      ),


    ),

               Row(
               children: [
                 SizedBox(
                   width: 15,
                 ),
               buildindicator(),

                 SizedBox(
                   width: width / 3,
                 ),

                 ElevatedButton(

             onPressed: (){

             },
             style:
             ButtonStyle(

               backgroundColor: MaterialStateProperty.resolveWith<Color>(
                     (Set<MaterialState> states) {
                   if (states.contains(MaterialState.pressed))
                     return Colors.white;
                   return Colors.red;
                 },
               ),
               shape:
               MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                       side: BorderSide(
                           color: Colors.white60)
                   )
               ),

             ),
             child: Text(
               '\tGet Started ',
               style: TextStyle(
                 color: Colors.white,
                 fontFamily: 'OpenSans',
                 fontSize: 17.0,
                 fontWeight: FontWeight.bold,
               ),
             ),


           ),

         ],

        )

],

      ),


         ],

    ),
        ),

    );
  }
  Widget buildindicator() =>
      AnimatedSmoothIndicator(
        activeIndex: activeindex,
        count: FruitList.length,
        effect: JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          dotColor: Colors.white,
        ),


      );
}