import 'dart:ui';
import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/screens/home/controller/HomeController.dart';

import '../consts/style.dart';

class MovieScreen extends StatelessWidget {
  final title;
  final dynamic image;
  final rate;
  final date;
  final overview;
  final index;
   MovieScreen({
    super.key,this.title , this.image,
     this.rate, this.date,this.overview, required this.index
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(HomeController());
   // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(controller.MoviesList[index].releaseDate!);
    return Scaffold(
      backgroundColor: K.blackColor,
      appBar: AppBar(  centerTitle: true,
          title:Text(controller.MoviesList[index].title!,style:K.carouselTextStyle),backgroundColor:K.primaryColor),
      body: Column(
          children:[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                //BackdropFilter(filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                  //  child:
                    Container(
              child:ColorFiltered(
              colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
      ),
                child: Image.network(image.toString(),
                       height: 300,
                       width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,),
         //               decoration:  BoxDecoration(
         //  image: DecorationImage(
         // image:(image:true? controller.MoviesList[index].posterPath:null ) as ImageProvider ,fit: BoxFit.cover),
                    //   )
                ),),
                Positioned(
                  bottom: 0,
                  left: 30,
                  child: Container(
                    height: 180,
                    width: 130,
                    decoration: BoxDecoration(
                    boxShadow: [
                    BoxShadow(
                   color: Colors.white.withOpacity(0.5), // Set the shadow color
                   spreadRadius: 4, // Control the spread of the shadow
                   blurRadius: 10, // Control the blur of the shadow
                   offset: Offset(0, 3), // Control the position of the shadow
    ),],
                 //     image:controller.MoviesList[index].posterPath as DecorationImage,
                      //ImageProvider(true? controller.MoviesList[index].posterPath:null ) as ImageProvider ,fit: BoxFit.cover,
                      border: Border.all(
                          color: Colors.white,
                          width: 5
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child:  Image.network(image.toString(),
                      height: 180,
                      width: 130,
                      fit: BoxFit.cover,),
                  ),
                 ),
                    //child:true? controller.MoviesList[index].posterPath:null ) as ImageProvider,),
                Positioned(
                  bottom: 0,
                  left: 200,
                  child:Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: K.primaryColor,
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0
                        )
                    ),
                    child:Center(child:
                    Text("Rating: ${controller.MoviesList[index].voteAverage!} / 10",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    ), ),),
              ]),),
            Padding(padding: EdgeInsets.all(10),
            child:Align(
              alignment: Alignment.centerLeft,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    K.sizedBoxH,
                    Text(title,textAlign: TextAlign.left,style: TextStyle(color: K.primaryColor,fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),

                    Text("Release date: ${controller.MoviesList[index].releaseDate!} ",textAlign: TextAlign.right,style: TextStyle(color: K.whiteColor,fontSize: 15,fontWeight: FontWeight.bold),)  ,

                    K.sizedBoxH,
                    Text("Overview",textAlign: TextAlign.right,style: TextStyle(color: K.primaryColor,fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(controller.MoviesList[index].overview!,
                      style: TextStyle(color: K.whiteColor,fontSize: 15,fontWeight: FontWeight.bold),),
                  ]
              ),
            ))]),
    );
  }
}