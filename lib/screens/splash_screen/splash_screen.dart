import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/screens/splash_screen/controller/SplashController.dart';

import '../../consts/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return Scaffold(
        backgroundColor: K.blackColor,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Image.asset("assets/images/movies.png"),
              K.sizedBoxH,
              SizedBox(
                width:200,
               child:LinearProgressIndicator(
                minHeight: 2,
                color: K.primaryColor,
                backgroundColor: K.primaryColor.withOpacity(.5),
                valueColor: AlwaysStoppedAnimation(K.primaryColor),
              )),
            ])));
  }
}
