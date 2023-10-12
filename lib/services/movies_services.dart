import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:movies_app/model/movies_model.dart'; //decode
class MoviesServices{//network layer
  String apiKey='3062138b73f3537d2f7dad556ee542e5';
  String url="https://api.themoviedb.org/3/discover/movie?api_key=3062138b73f3537d2f7dad556ee542e5";

  //msg,status-code,body
  static Future<List<Results>?> fetchMovies()async{
  final response=await http.get(Uri.parse("https://api.themoviedb.org/3/discover/movie?api_key=3062138b73f3537d2f7dad556ee542e5"));//this is a request
  if(response.statusCode==200)
  {
   final jsonRes=jsonDecode(response.body);//aldata al raw mn json hatt7wel l map
   print(jsonRes);
   //List <dynamic> movieResult=jsonRes["results"];
   //var movies=movieResult.map((e)=>Movie.fromJson(e),).toList();
   //print(movies);
   //return movies;
   final moviesRes=MoviesModel.fromJson(jsonRes);
    return moviesRes.results;

  }
  else
    print("error");
  throw Exception("error");
  }

}