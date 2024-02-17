import 'package:get/get.dart';

class CategoriesController extends GetxController {
  RxList colorPhotoList = [
    {"img": "assets/colors_ideas/grey.jpg", "Text": "grey"},
    {"img": "assets/colors_ideas/orange.jpg", "Text": "orange"},
    {"img": "assets/colors_ideas/black.jpg", "Text": "black"},
    {"img": "assets/colors_ideas/pink.jpg", "Text": "pink"},
    {"img": "assets/colors_ideas/b.jpg", "Text": "blue"},
    {"img": "assets/colors_ideas/y.jpg", "Text": "yellow"},
    {"img": "assets/colors_ideas/r.jpg", "Text": "red"},
  ].obs;



  RxList categoryList = [
    {"img": "assets/category/cat1.png", "Text": "Abstract"},
    {"img": "assets/category/cat2.png", "Text": "Minimal"},
    {"img": "assets/category/cat3.png", "Text": "Animals"},
    {"img": "assets/category/cat4.png", "Text": "Nature"},
    {"img": "assets/category/cat5.png", "Text": "Architecture"},
    {"img": "assets/category/cat6.png", "Text": "Plants"},
    {"img": "assets/category/cat7.png", "Text": "Art"},
    {"img": "assets/category/cat8.png", "Text": "Space"},
    {"img": "assets/category/cat9.png", "Text": "Colours"},
    {"img": "assets/category/cat10.png", "Text": "Food"},
    {"img": "assets/category/cat11.png", "Text": "Texture"},
  ].obs;
}
