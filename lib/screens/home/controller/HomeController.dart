import 'package:get/get.dart';
import 'package:movies_app/screens/home_screen/Barbie.dart';

import '../../../model/movies_model.dart';
import '../../../services/movies_services.dart';

class HomeController extends GetxController{
  var currentIndex = 0.obs;
  var selectedIndex=0.obs;
  void onChangePage(int index){
  currentIndex.value=index;
  }
  void changeTap(int index){
  //Get.to(Barbie());
  selectedIndex.value=index;
 }
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