import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/screens/viewphoto.dart';


import '../controller/homecontroller.dart';
import 'basescreen.dart';


class DesireCatPhotoScreen extends StatefulWidget {
  const DesireCatPhotoScreen({super.key});

  @override
  State<DesireCatPhotoScreen> createState() => _DesireCatPhotoScreenState();
}

class _DesireCatPhotoScreenState extends State<DesireCatPhotoScreen> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101113),
      // appBar: AppBar(backgroundColor: Color(0xff202123)),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GridView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeController.desireCatPhotosList.length,
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 220,
                crossAxisSpacing: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  img = homeController.desireCatPhotosList[index]["src"]["original"];
                  Get.to(ViewPhoto());
                },
                child: Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage("${homeController.desireCatPhotosList[index]["src"]["large"]}"),fit: BoxFit.cover)
                  ),

                ),
              );
            },
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(

        onPressed: () {
           Get.back();
          homeController.desireCatPhotosList.clear();
        },
        backgroundColor: Colors.blueGrey,

        child: Icon(Icons.arrow_back, weight: 20, color: Colors.white,size: 25),
      ),
    );
  }
}
