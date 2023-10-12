import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/data.dart';
import 'MovieScreen.dart';

class customCard3 extends StatelessWidget{
 final image;
 final name;
  final int screenIndex;
  const customCard3({super.key,required this.image,required this.screenIndex, this.name});

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
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5.0),
         border: Border.all(color: Colors.white,width: 2.0),
    ),
    child:Image.network(image.toString(),
    height: 280,
    width: 230,
    fit: BoxFit.cover,)
       ),
   );
  }

}