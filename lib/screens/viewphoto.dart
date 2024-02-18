import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'basescreen.dart';

class ViewPhoto extends StatefulWidget {
  const ViewPhoto({super.key});

  @override
  State<ViewPhoto> createState() => _ViewPhotoState();
}

class _ViewPhotoState extends State<ViewPhoto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff101113),
        appBar: AppBar(
          backgroundColor: Color(0xff101113),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white70,
              )),
        ),
        body: Obx(() {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Container(
                  height: Get.height / 1.3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: NetworkImage("$img"), fit: BoxFit.fill),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: '$img',
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                    Center(child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline),
                  ),

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    children: [
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 20,
                        child: IconButton(
                          onPressed: () async {
                            final uri = Uri.parse("$img");
                            final res = await http.get(uri);
                            final bytes = res.bodyBytes;
                            final temp = await getTemporaryDirectory();
                            final path = "${temp.path}/image.jpg";
                            File(path).writeAsBytesSync(bytes);

                            Share.shareFiles([path]);
                          },
                          icon: Icon(Icons.share, color: Colors.white70),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: IconButton(
                          onPressed: () async {
                            try {
                              await GallerySaver.saveImage("$img",
                                      albumName: 'Wallwrap')
                                  .then((success) {
                                if (success != null && success) {
                                  Get.snackbar(
                                      "Image saved to gallery.🚀", "Cheers!!",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.blueGrey,
                                      duration: Duration(seconds: 1));
                                }
                              });
                            } catch (e) {
                              log('ErrorWhileSavingImg: $e');
                            }
                          },
                          icon: Icon(Icons.download, color: Colors.white70),
                        ),
                        radius: 20,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: IconButton(
                          onPressed: () {
                            if (likeImg.contains(img)) {
                              likeImg.remove(img);
                            } else {
                              likeImg.add(img);
                            }
                          },
                          icon: (likeImg.contains(img))
                              ? Icon(Icons.favorite_outlined, color: Colors.red)
                              : Icon(Icons.favorite_border_outlined,
                                  color: Colors.white70),
                        ),
                        radius: 20,
                      ),
                      Spacer()
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
