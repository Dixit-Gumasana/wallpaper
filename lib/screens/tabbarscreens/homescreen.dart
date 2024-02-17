import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homecontroller.dart';
import '../basescreen.dart';
import '../desirecategoriesscreen.dart';
import '../viewphoto.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.PhotosFunction(query: "popular");
    homeController.PhotosFunction(query: "trending");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Color(0xff101113),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 10),
              child: Text("Trending", style: TextStyle(
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400
              ),),
            ),
            SizedBox(
              height: 100,
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.trendingPhotosList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          img =
                          homeController.trendingPhotosList[index]["src"]["original"];
                          Get.to(ViewPhoto());


                        },
                        child: Container(width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.2,
                              color: Color(0xffffffff)
                            ),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: NetworkImage(
                                  "${homeController
                                      .trendingPhotosList[index]["src"]["large"]}"),
                                  fit: BoxFit.cover)

                          ),

                        ),
                      ),
                    );
                  },);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 15),
              child: Text("Popular", style: TextStyle(
                  fontSize: 21,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400
              ),),
            ),
            Obx(() {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: homeController.popularPhotosList.length,
                padding: EdgeInsets.only(
                    left: 12, top: 12, right: 12, bottom: 15),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 250
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      img =
                      homeController.popularPhotosList[index]["src"]["original"];
                      Get.to(ViewPhoto());

                    },
                    child: Container(
                      height: 200,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(image: NetworkImage(
                              "${homeController
                                  .popularPhotosList[index]["src"]["large"]}"),
                              fit: BoxFit.cover)

                      ),
                    ),
                  );
                },);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(AlertDialog(
            backgroundColor: Colors.blueGrey.shade100,
            actions: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: homeController.searchFormKey.value,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search Here!!",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    controller: homeController.searchController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Detail";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        if (homeController.searchFormKey.value.currentState!
                            .validate()) {
                          homeController.PhotosFunction(
                              query: homeController.searchController.text);
                          Get.offAll(DesireCatPhotoScreen());
                          homeController.searchController.clear();
                          homeController.desireCatPhotosList.clear();
                        }
                      },
                      child: Text("Search")),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Get.back();
                        homeController.searchController.clear();
                      },
                      child: Text("cancle")),
                ],
              )
            ],
          ));
        },
        backgroundColor: Colors.blueGrey,
        // Color(0xff202123),
        child: Icon(Icons.search,color: Colors.white,weight: 20),
      ),

    ));
  }
}
