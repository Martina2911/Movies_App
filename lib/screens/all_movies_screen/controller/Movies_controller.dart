import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:movies_app/services/movies_services.dart';

import '../../../model/movies_model.dart';

class Movies_controller extends GetxController{
  final MoviesList =<Results>[].obs;

  fetchMovies()async{
    isloading.value=true;
    MoviesList.value=(await MoviesServices.fetchMovies())!.cast<Results>();
    isloading.value=false;
  }
  //for each fetch has a loading
  RxBool isloading=false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }
}