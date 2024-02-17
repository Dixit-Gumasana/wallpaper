

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/screens/tabbarscreens/categoriesscreen.dart';
import 'package:wallpaper/screens/tabbarscreens/homescreen.dart';
import 'package:wallpaper/screens/tabbarscreens/likedscreen.dart';



String? img;
RxList likeImg = [].obs;


class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff101113),
          appBar: AppBar(
            backgroundColor: Color(0xff202123),
            title: Text("WallWrap",style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,

            )),
            centerTitle: true,
            bottom: TabBar(

              physics: NeverScrollableScrollPhysics(),
              automaticIndicatorColorAdjustment: true,
              dividerHeight: 0,
              indicatorWeight: 1.5,


              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white60,
              labelColor: Colors.white60,
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
              unselectedLabelColor: Colors.white38,
              unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),


              tabs: [
                Tab(
                  child: Text("Home"),
                ),
                Tab(
                  text: "Categories",
                ),
                Tab(
                  text: "Liked",
                ),

              ],
              // isScrollable: true,
            ),
          ),
          body: TabBarView(children: [
            HomeScreen(),
            CategoriesScreen(),
            LikedScreen()

          ]),
        ),
      ),
    );
  }
}
