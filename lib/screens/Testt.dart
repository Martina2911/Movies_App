import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/movies_services.dart';

class Testt extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ElevatedButton(onPressed: () {
       MoviesServices.fetchMovies();
     }, child: null,),
   );
  }

}