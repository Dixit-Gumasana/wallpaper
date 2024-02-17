import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../basescreen.dart';
import '../viewphoto.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101113),
      body: Obx(() {
        return GridView.builder(
          itemCount: likeImg.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 220,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                img = likeImg[index];
                Get.to(ViewPhoto());
              },
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.5
                  ),
                  // color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage("${likeImg[index]}"),
                      fit: BoxFit.cover),
                ),
                child: Align(
                  alignment: Alignment.topRight,

                  child: GestureDetector(
                    onTap: () {
                      likeImg.removeAt(index);

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3,top: 3),
                      child: CircleAvatar(

                        backgroundColor: Colors.blueGrey,
                        radius: 10,
                        child: Icon(Icons.close,color: Colors.white70,size: 20),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },);
      }),
    );
  }
}
