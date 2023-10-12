import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../consts/style.dart';
import '../data.dart';
import 'MovieScreen.dart';


class CustomCard extends StatelessWidget{
  final image;
  final age;
  final screenIndex;
  final name;
  const CustomCard({Key? key, required this.image,required this.age,required this.screenIndex, this.name}) : super(key: key);

  void navigateToScreen() {
    if (screenIndex >= 0 && screenIndex < screens.length) {
      Get.to(MovieScreen(index: screenIndex,image: image,title: name,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:navigateToScreen,
      child: Container(
          height:300,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(children :[
            Center(
             child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 10,
                    blurRadius: 20, // Blur radius
                    offset: Offset(0, 5), // Offset of the shadow
                  ),
                ],
              ),
                child:Image.network(image.toString(),width:200,height:300,fit:BoxFit.cover,)
             ),),
           SingleChildScrollView(child: Column(children:[
             SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                        color: K.primaryColor.withOpacity(0.6),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(15),
                          bottomLeft:Radius.circular(15),
                        )
                    ),
                    child: Center(child:Text("${age!}",style:
                    TextStyle(color: Colors.white,fontSize: 15),),
                    )
                ),
                //SizedBox(width: 27,),
              ],
            ),
            SizedBox(height: 170,),
             Padding(padding:EdgeInsets.all(20),
                 child:Align(
                   alignment: Alignment.centerLeft,
                 child:Text(name,style: K.carouselTextStyle2,textAlign:TextAlign.left,),
             ), ),
    // Positioned.fill(
    // child: Container(
    // decoration: BoxDecoration(
    // gradient: LinearGradient(
    // begin: Alignment.center,
    // end: Alignment.bottomCenter,
    // colors: [
    // Colors.black.withOpacity(0.9), // Adjust opacity as needed
    // ],
    // stops: [1.0, 1.5], // Adjust the gradient stops
    // ),
    // ),),
    // ),
        ])
    )
    ]),
    ),
    );
  }
}