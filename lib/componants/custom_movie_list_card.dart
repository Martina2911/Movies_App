import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/componants/MovieScreen.dart';
import 'package:octo_image/octo_image.dart';

import '../consts/style.dart';
import '../data.dart';

class CustomMovieCard extends StatelessWidget {
  final image;
  final name;
  final screenIndex;
  const CustomMovieCard({Key? key, required this.image, required this.name,required this.screenIndex})
      : super(key: key);

  void navigateToScreen() {
    if (screenIndex >= 0 && screenIndex < screens.length) {
      Get.to(MovieScreen(title: name,index: screenIndex,image: image,));
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:navigateToScreen ,
      child: Container(
          height: 320,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 2.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: SingleChildScrollView(child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children:
              [
                Image.network(image.toString(),
                  height: 240,
                  width: 150,
                  fit: BoxFit.cover,),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                          color: K.whiteColor,
                          width: 1.0
                        )
                      ),
                      child: Center(
                          child: Text(" $name ", textAlign:TextAlign.center,style: const TextStyle(fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),)),
                    )

                ])
      )
      ) ,
    );
  }
}
