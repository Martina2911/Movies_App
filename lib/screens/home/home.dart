import 'dart:math';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/componants/animated_indicator.dart';
import 'package:movies_app/componants/custom_movie_list_card.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/screens/home_screen/TheNun.dart';
import 'package:movies_app/screens/splash_screen/splash_screen.dart';
import '../../componants/custom_card.dart';
import '../../consts/style.dart';
import '../../data.dart';
import '../../helper/connectivity.dart';
import '../../services/movies_services.dart';
import '../all_movies_screen/all_movies_screen.dart';
import 'controller/HomeController.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final connection = Get.put(ConnectionStatusSingleton());
    return Scaffold(
        appBar: AppBar(
            title: const Text('Home', style: K.carouselTextStyle),
            backgroundColor: K.primaryColor),
        body: Obx(
          () => connection.connectivity.value == 0
              ? Image.asset(
                  "assets/images/noConnection.png",
                  color: K.primaryColor,
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-3ld77a/assets/q35cmbhenba2/bg.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        K.sizedBoxH,
                        FutureBuilder(
                            future: MoviesServices.fetchMovies(),
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.hasData) {
                                List<Results>? data = snapshot.data;
                                //       Obx(() => //circular progress indicator
                                return CarouselSlider.builder(
                                  itemCount: data?.length,
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    return CustomCard(
                                      image: data?[index].posterPath,
                                      age: (data?[index].adult)!
                                          ? "for Adults"
                                          : "for All",
                                      screenIndex: index,
                                      name: data?[index].title,
                                    );
                                  },
                                  options: CarouselOptions(
                                      onPageChanged: (index, r) {
                                        controller.onChangePage(index);
                                      },
                                      height: 300,
                                      aspectRatio: 1.0,
                                      autoPlay: true,
                                      enableInfiniteScroll: true,
                                      viewportFraction: .6,
                                      enlargeCenterPage: true),
                                );
                              } else {
                                return Container(
                                    height: MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      color: K.primaryColor,
                                    ),
                                    child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Center(
                                          child: Column(children: [
                                            CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "loading",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
                                            ),
                                          ]),
                                        )));
                              }
                            }),
                        //),),
                        K.sizedBoxH,
                        //Obx((){return AnimatedIndicator(currentIndex: controller.currentIndex.value);}),
                        K.sizedBoxH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: const Text("New Releases",
                                  style: K.carouselTextStyle),
                              onTap: () {
                                Get.to(AllMoviesScreen());
                              },
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            GestureDetector(
                              child: const Text("See more",
                                  style: K.carouselTextStyle),
                              onTap: () {
                                Get.to(AllMoviesScreen());
                              },
                            ),
                          ],
                        ),
                        K.sizedBoxH,
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3.h,
                          child: Obx(() =>ListView.builder(
                                itemCount: controller.MoviesList.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomMovieCard(
                                        image: controller.MoviesList[index].posterPath,
                                        name:
                                            controller.MoviesList[index].title,
                                        screenIndex: index,
                                      ));
                                },)
                          ),
                        ),
                        K.sizedBoxH,
                        K.sizedBoxH,
                      ]),
                    ),
                  ),
                ),
        ),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            backgroundColor: K.primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: K.primaryColor,
            selectedLabelStyle: TextStyle(color: K.primaryColor),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            selectedIconTheme: IconThemeData(color: K.primaryColor),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            currentIndex: controller.selectedIndex.value,
            onTap: (int i) {
              controller.changeTap(i);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books_outlined),
                  label: 'Offer',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  label: 'Message',
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                  backgroundColor: Colors.black),
            ],
          );
        }));
  }
}
