import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/screens/home/controller/HomeController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../consts/style.dart';
import '../data.dart';

class AnimatedIndicator extends StatelessWidget {
   AnimatedIndicator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;
final controller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: currentIndex,
      count: controller.MoviesList.length,
      effect:   ExpandingDotsEffect(
        dotColor: K.blackColor,
        expansionFactor: 2,
        dotHeight: 7,
        dotWidth: 7,
        activeDotColor: K.primaryColor,
      ),
    );
  }
}