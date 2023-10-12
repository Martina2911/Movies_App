
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/componants/MovieScreen.dart';
import 'package:movies_app/screens/home/controller/HomeController.dart';
import 'package:movies_app/screens/home_screen/Barbie.dart';
import 'package:movies_app/screens/home_screen/FastX.dart';
import 'package:movies_app/screens/home_screen/HeartOfStone.dart';
import 'package:movies_app/screens/home_screen/TheLittleMermaid.dart';
import 'package:movies_app/screens/home_screen/TheMeg2.dart';
import 'package:movies_app/screens/home_screen/TheNun.dart';

final controller=Get.put(HomeController());
List <Map> images = [
  {"image": "https://people.com/thmb/OWJ7GxH4QeownnPXJKNStG7H9V4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(674x0:676x2):format(webp)/barbie-film-040623-3-2000-7397405bc6f0493d80ef365a55fba7eb.jpg","age":13},
  {"image":"https://images.disneymovieinsiders.com/45e302be324f9489547237e12b27362b/472ac44d-1e46-4cd3-b20b-f82211f8aed1.jpg","age":8},
  {"image": "https://m.media-amazon.com/images/M/MV5BMTM2NTU1ZTktNjc4YS00NjNhLWE4NmYtOTM2YjFjOGUzNmYzXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_QL75_UX190_CR0,0,190,281_.jpg","age":12},
  {"image":'https://m.media-amazon.com/images/M/MV5BMzE1ZThhYWEtZWYzOS00ODk0LThlNDQtMGIwMTNhNzk1ZjYxXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',"age":15},
  {"image":'https://upload.wikimedia.org/wikipedia/en/b/bc/The_Nun_II_%282023%29.jpg',"age":18},
  {"image":"https://m.media-amazon.com/images/M/MV5BNzZmOTU1ZTEtYzVhNi00NzQxLWI5ZjAtNWNhNjEwY2E3YmZjXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg","age":12},

];

List <Map> images2 = [
  {"image":"https://people.com/thmb/OWJ7GxH4QeownnPXJKNStG7H9V4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(674x0:676x2):format(webp)/barbie-film-040623-3-2000-7397405bc6f0493d80ef365a55fba7eb.jpg","name":"Barbie"},
  {"image":"https://images.disneymovieinsiders.com/45e302be324f9489547237e12b27362b/472ac44d-1e46-4cd3-b20b-f82211f8aed1.jpg","name":"The Little Mermaid"},
  {"image":"https://m.media-amazon.com/images/M/MV5BMTM2NTU1ZTktNjc4YS00NjNhLWE4NmYtOTM2YjFjOGUzNmYzXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_QL75_UX190_CR0,0,190,281_.jpg","name":"The Meg 2"},
  {"image":'https://m.media-amazon.com/images/M/MV5BMzE1ZThhYWEtZWYzOS00ODk0LThlNDQtMGIwMTNhNzk1ZjYxXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg',"name":"Heart Of Stone"},
  {"image":'https://upload.wikimedia.org/wikipedia/en/b/bc/The_Nun_II_%282023%29.jpg',"name":"The Nun 2"},
  {"image":"https://m.media-amazon.com/images/M/MV5BNzZmOTU1ZTEtYzVhNi00NzQxLWI5ZjAtNWNhNjEwY2E3YmZjXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_FMjpg_UX1000_.jpg","name":"Fast X"},

];

List screens=[
 for(int i=0;i<controller.MoviesList.length;i++){
MovieScreen(title: controller.MoviesList[i].title,
  //bigimage: controller.MoviesList[i].posterPath,
  //smallimage: controller.MoviesList[i].posterPath,
  rate: controller.MoviesList[i].releaseDate, date: controller.MoviesList[i].releaseDate, index: i,)
 }
];