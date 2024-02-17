import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/categoriescontroller.dart';
import '../../controller/homecontroller.dart';
import '../desirecategoriesscreen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final catController = Get.put(CategoriesController());
  final homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 10),
            child: Text(
              "Colors",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 10),
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: catController.colorPhotoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        homeController.PhotosFunction(query: catController.colorPhotoList[index]["Text"]);
                        Get.to(DesireCatPhotoScreen());
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: AssetImage(
                                    "${catController.colorPhotoList[index]["img"]}"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  );
                },
              )),

          Padding(
            padding: const EdgeInsets.only(left: 12, top: 15),
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400),
            ),
          ),
          GridView.builder(
            itemCount: catController.categoryList.length,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 12, right: 10, top: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                mainAxisExtent: 100),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  homeController.PhotosFunction(query: catController.categoryList[index]["Text"]);
                  Get.to(DesireCatPhotoScreen());


                },
                child: Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(

                    image: DecorationImage(image: AssetImage("${catController.categoryList[index]["img"]}"),fit: BoxFit.cover)
                  ),
                  child: Center(child: Text("${catController.categoryList[index]["Text"]}",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70
                  )), ),
                ),
              );
            },
          )
        ],
      ),
    ));
  }
}
