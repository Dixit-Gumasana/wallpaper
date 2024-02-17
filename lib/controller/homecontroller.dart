import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList trendingPhotosList = [].obs;
  RxList popularPhotosList = [].obs;
  RxList desireCatPhotosList = [].obs;
  RxInt page = 1.obs;

  final searchController = TextEditingController();
  final searchFormKey = GlobalKey<FormState>().obs;

  PhotosFunction({query = "trending", page = '1'}) async {
    try {
      var res = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=80&page=$page"),
        headers: {
          'Authorization':
              'jq1LLQMkBvOgMvkFCD4RngDMI13w32RgGxWVM0X8QUOdCXzm9h8iwWAc'
        },
      );
      var data = jsonDecode(res.body);

      if (res.statusCode == 200 || res.statusCode == 201) {
        if (query == "trending") {
          trendingPhotosList.addAll(data["photos"]);
          // debugPrint("---->>>>>$page");
          // debugPrint("--->>>-TrendingPhotos--$trendingPhotosList");
        } else if (query == "popular") {
          popularPhotosList.addAll(data["photos"]);
          // debugPrint("--->>>-PopularPhotos--$popularPhotosList");
        } else {
          desireCatPhotosList.addAll(data["photos"]);
          // debugPrint("$searchPhotosList");
        }
      } else {
        debugPrint("----ERROR---->>>");
      }
    } catch (e) {
      debugPrint("---Error--->>>$e");
    }
  }
}
