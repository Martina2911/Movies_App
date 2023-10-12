import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:movies_app/componants/custom_card_inallMoviesScreen.dart';
import '../../helper/connectivity.dart';
import '../../consts/style.dart';
import 'controller/Movies_controller.dart';

class AllMoviesScreen extends StatelessWidget{
  //final Results ?r;
  AllMoviesScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    final connection=Get.put(ConnectionStatusSingleton());
    final controller=Get.put(Movies_controller());
   return Scaffold(
     appBar: AppBar(title:const Text('All Movies',style:K.carouselTextStyle),backgroundColor:K.primaryColor),
       body:Obx(()=> connection.connectivity.value==0?
       Image.asset("assets/images/noConnection.png",color: K.primaryColor,):
       Container(
           decoration: const BoxDecoration(
           image: DecorationImage(image:NetworkImage('https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-3ld77a/assets/q35cmbhenba2/bg.jpeg'),
       fit: BoxFit.cover
   ),),
    child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
    child:Container(
         child:
    //  FutureBuilder(future: MoviesServices.fetchMovies(),
         //  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
         //{
           //if(snapshot.hasData){
             //List <Movie>? data=snapshot.data;
    //         return
             Obx(()=> GridView.builder(
               shrinkWrap: true,
               padding: EdgeInsets.all(10),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio:.6,
                 mainAxisSpacing: 15,
                 crossAxisSpacing: 15,
               ),
               itemCount:controller.MoviesList.length,
               itemBuilder: (BuildContext context, int index) {
                 return customCard3(image:controller.MoviesList[index].posterPath,//controller.MoviesList[index].posterPath,
                   screenIndex: index,name: controller.MoviesList[index].title);
               },
             ),
           //}
              // else
                // {
                 // return const Center(child: Text("loading"),);
                 //}
        // },
       ),

      )
     )
    )
  ));
  }
}
//controller2.MoviesList[index].posterPath
//controller2.MoviesList.length


/* using Future :
child:FutureBuilder(future: MoviesServices.fetchMovies(),
           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
         {
           if(snapshot.hasData){
             List <Movie>? data=snapshot.data;
             return   GridView.builder(
               shrinkWrap: true,
               padding: EdgeInsets.all(10),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio:.6,
                 mainAxisSpacing: 15,
                 crossAxisSpacing: 15,
               ),itemCount:data?.length,//controller.MoviesList.length,
               itemBuilder: (BuildContext context, int index) {
                 return customCard3(image:data?[index].image,//controller.MoviesList[index].posterPath,
                   screenIndex: index,);
               },
             );
           }
               else
                 {
                  return const Center(child: Text("loading"),);
                 }
         },)*/